//
//  Model.swift
//  Remarks
//
//  Created by val on 3/3/20.
//  Copyright © 2020 VL. All rights reserved.
//

import Foundation

class Model {
    
    var notes:[[String: String]]{
        set {
            UserDefaults.standard.set(newValue, forKey: "notesData")
            UserDefaults.standard.synchronize()
        }
        get {
            if let saveNotes = UserDefaults.standard.array(forKey: "notesData") as?  [[String: String]]{
                return saveNotes
            } else {
                return []
            }
        }
    }
    
    func addNote(newNoteTitle: String, newNoteDescription: String) {
        notes.append(["title": newNoteTitle, "descriprion": newNoteDescription])
    }
    
    func removeNote(at index: Int){
        notes.remove(at: index)
    }
    
    func swapNote(fromIndex: Int, toIndex: Int){
        let elementToMove = notes[fromIndex]
        notes.remove(at: fromIndex)
        notes.insert(elementToMove, at: toIndex)
    }
    
}

