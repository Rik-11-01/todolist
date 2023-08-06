//
//  todolistviewmodel.swift
//  todolist
//
//  Created by Ritik Raman on 15/07/23.
//
import FirebaseFirestore
import Foundation
//view model for for list view of items view
class todolistviewmodel:ObservableObject{
    @Published var showingnewitemview=false
    
    private let userId: String
    init(userId:String){
        self.userId=userId
    }
 
    
    /// delete to do list item
    /// - Parameter id: item id to delete
    func delete(id:String){
        let db=Firestore.firestore()
        
        db.collection("user")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
}
