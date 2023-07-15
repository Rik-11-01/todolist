//
//  ContentView.swift
//  todolist
//
//  Created by Ritik Raman on 14/07/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewmodel=contentviewmodel()
    
    var body: some View {
        if viewmodel.issignedin,!viewmodel.current_user_id.isEmpty{
            //signed in
            todolistview()
        }else{
            loginview()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
