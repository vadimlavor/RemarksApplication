//
//  TableViewController.swift
//  Remarks
//
//  Created by val on 3/3/20.
//  Copyright © 2020 VL. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Noteworthy", size: 24) as Any, NSAttributedString.Key.foregroundColor: UIColor.blue]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let currentItem = model.notes[indexPath.row]
        cell.textLabel?.text = currentItem["title"]
        cell.detailTextLabel?.text = currentItem["descriprion"]
        cell.accessoryType = .detailButton
        if tableView.isEditing {
            cell.textLabel?.textColor = UIColor.purple
            cell.detailTextLabel?.textColor = UIColor.magenta
        } else {
            cell.textLabel?.textColor = UIColor.black
            cell.detailTextLabel?.textColor = UIColor.darkGray
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        let currentItem = model.notes[indexPath.row]
        vc?.getName = currentItem["title"] ?? ""
        vc?.getDescription = currentItem["descriprion"] ?? ""
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        model.swapNote(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if tableView.isEditing{
            return .none
        } else {
            return .delete
        }
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            model.removeNote(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
    
    @IBAction func editNotesButtonPressed(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() +  0.3) {
            self.tableView.reloadData()
        }
    }
    
    @IBAction func addNotesButtonPressed(_ sender: Any) {
        let alertController = AlertController()
        alertController.addTextField(textFieldPlaceHolder: "Enter a note name")
        alertController.addTextField(textFieldPlaceHolder: "Enter a note description")
        alertController.addActionAddNote(to: tableView, from: model)
        alertController.addActionCancel()
        alertController.show(to:self)
        tableView.reloadData()
    }
    
}

