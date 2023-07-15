//
//  contentviewmodel.swift
//  todolist
//
//  Created by Ritik Raman on 15/07/23.
//

import Foundation
import FirebaseAuth

class contentviewmodel:ObservableObject{
    @Published var current_user_id:String=""
    private var handler:AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async{
                self?.current_user_id = user?.uid ?? ""

            }
        }
    }
    
    public var issignedin: Bool{
        return Auth.auth().currentUser != nil
    }
}
