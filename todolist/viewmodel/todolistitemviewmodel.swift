//
//  todolistitemviewmodel.swift
//  todolist
//
//  Created by Ritik Raman on 15/07/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class todolistitemviewmodel:ObservableObject{
    init(){}
    func toggleIsDone(item:todolistitem){
        var newitem=item
        newitem.setdone(!item.isdone)
        
        guard let uid=Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        db.collection("user")
            .document(uid)
            .collection("todos")
            .document(newitem.id)
            .setData(newitem.asdictionary())
        
    }
}
