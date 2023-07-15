//
//  loginviewmodel.swift
//  todolist
//
//  Created by Ritik Raman on 15/07/23.
//

import Foundation
import FirebaseAuth

class loginviewmodel:ObservableObject{
    
    @Published var email=""
    @Published var password=""
    @Published var errormessage=""
    
    init(){
        
    }
    
    func login(){
        guard validate() else{
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func validate()->Bool{
        errormessage=""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,!password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errormessage="Incorrect email/password"
            return false
        }
        guard email.contains("@")&&email.contains(".") else{
            errormessage="please enter valid email"
            return false
        }
        return true
    }
    
    
}
