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
            accountview
        }else{
            loginview()
        }
    }
    @ViewBuilder
    var accountview:some View{
        TabView{
            todolistview(userId:viewmodel.current_user_id)
                .tabItem{
                    Label ("Home", systemImage:"house")
                }
            profileview()
                .tabItem{
                    Label("Profile",systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
