//
//  todolistApp.swift
//  todolist
//
//  Created by Ritik Raman on 14/07/23.
//

import SwiftUI
import FirebaseCore

@main
struct todolistApp: App {
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
