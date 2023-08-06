//
//  profileviewmodel.swift
//  todolist
//
//  Created by Ritik Raman on 15/07/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class profileviewmodel:ObservableObject{
    init(){}
    
    @Published var users: user? = nil
    
    func fetchuser(){
        
        guard let userId=Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        db.collection("user")
            .document(userId).getDocument{
               [weak self] snapshot,error in guard let data = snapshot?.data(), error == nil else{
                    return
                }
                DispatchQueue.main.async {
                    self?.users = user(
                    id:data["id"] as? String ?? "",
                    name:data["name"] as? String ?? "",
                    email:data["email"] as? String ?? "",
                    joined:data["joined"] as? TimeInterval ?? 0
                    )
                }
            }
    }
    func logout(){
        do{
            try Auth.auth().signOut()
        } catch{
            print(error)
        }
    }
   
}
