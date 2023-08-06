//
//  newitemviewmodel.swift
//  todolist
//
//  Created by Ritik Raman on 15/07/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class newitemviewmodel:ObservableObject{
    @Published var title=""
    @Published var duedate=Date()
     @Published var showalert=false
    init(){}
 
    func save(){
        guard cansave else{
            return
        }
            //get user id
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
            //create a model
        let newid=UUID().uuidString
        let newitem=todolistitem(id: newid, title: title, duedate: duedate.timeIntervalSince1970, createddate: Date().timeIntervalSince1970, isdone: false)
        
            //save
        let db=Firestore.firestore()
        db.collection("user")
            .document(uid)
            .collection("todos")
            .document(newid)
            .setData(newitem.asdictionary())
        
    }
    var cansave:Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard duedate>=Date().addingTimeInterval(-86400)else{
            return false
        }
        return true
        
    }
}
