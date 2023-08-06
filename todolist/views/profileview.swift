//
//  profileview.swift
//  todolist
//
//  Created by Ritik Raman on 14/07/23.
//

import SwiftUI

struct profileview: View {
    @StateObject var viewmodel=profileviewmodel()
    var body: some View {
        NavigationView{
            VStack{
                //Avatar
                if let user=viewmodel.users{
                    profile(user: user)
                }else{
                    Text("Loading Profile....")
                }
            }
            .navigationTitle("Profile")
            
        }
        .onAppear{
            viewmodel.fetchuser()
        }
    }
    @ViewBuilder
    func profile(user: user) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width:125,height: 125)
            .padding()
            //info
        VStack(alignment: .leading){
            HStack{
                Text("Name:")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack{
                Text("Email:")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack{
                Text("Memeber_Since")
                    .bold()
                Text("\(Date(timeIntervalSinceReferenceDate:  user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
    Button( "Log Out") {
            viewmodel.logout()
        }
    .tint(.red)
    }
}

struct profileview_Previews: PreviewProvider {
    static var previews: some View {
        profileview()
    }
}
