//
//  AlertController.swift
//  Remarks
//
//  Created by val on 3/3/20.
//  Copyright © 2020 VL. All rights reserved.
//

import Foundation
import UIKit

class AlertController{
    
    let alertController = UIAlertController(title: "Add Note", message: "", preferredStyle: .alert)
    
    func addTextField(textFieldPlaceHolder: String?){
        alertController.addTextField { (textField) in
            textField.placeholder = textFieldPlaceHolder
            textField.textAlignment = NSTextAlignment.justified
            textField.backgroundColor = .clear
            textField.textColor = .black
            textField.borderStyle = .roundedRect
        }
    }
    
    func addActionAddNote(to table: UITableView, from model: Model){
        let actionAdd = UIAlertAction(title: "Add", style: .default) { (action) in
            let newNoteTitle = self.alertController.textFields?[0].text
            let newNoteDescription = self.alertController.textFields?[1].text
            if newNoteTitle!.isEmpty{
                return
            } else {
                model.addNote(newNoteTitle: newNoteTitle ?? "", newNoteDescription: newNoteDescription ?? "" )
                table.reloadData()
            }
        }
        alertController.addAction(actionAdd)
    }
    
    func addActionCancel(){
        let actionCancel = UIAlertAction(title: "Close", style: .destructive, handler: nil)
        alertController.addAction(actionCancel)
    }
    
    func show(to controller: UIViewController){
        controller.present(alertController, animated: true, completion: nil)
    }
    
}
