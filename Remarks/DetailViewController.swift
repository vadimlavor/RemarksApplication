//
//  DetailViewController.swift
//  Remarks
//
//  Created by val on 6/15/20.
//  Copyright © 2020 VL. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var getName = String()
    var getDescription = String()
    
    @IBOutlet weak var titleNoteLabel: UILabel!
    @IBOutlet weak var detailNoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleNoteLabel.text = getName
        detailNoteLabel.text = getDescription
    }
    
}
