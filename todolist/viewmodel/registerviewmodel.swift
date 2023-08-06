//
//  registerviewmodel.swift
//  todolist
//
//  Created by Ritik Raman on 15/07/23.
//
import FirebaseFirestore
import Foundation
import FirebaseAuth
class registerviewmodel:ObservableObject{
    @Published var name:String=""
    @Published var email:String=""
    @Published var password:String=""
    
    init(){}
    
    func register(){
        guard validate() else{
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard let userId=result?.user.uid else{
                return
            }
            self.insertuserid(id:userId)
        }
    }
    
    private func insertuserid(id:String){
        let newuser=user(id: id, name: name, email: email, joined: Date.timeIntervalSinceReferenceDate)
        let db=Firestore.firestore()
        db.collection("user")
            .document(id)
            .setData(newuser.asdictionary())
        
    }
    
    private func validate()->Bool{
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard email.contains("@")&&email.contains(".") else{
            return false
        }
        guard password.count>=6 else{
            return false
        }
        return true
    }
    
}
