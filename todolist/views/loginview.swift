//
//  loginview.swift
//  todolist
//
//  Created by Ritik Raman on 14/07/23.
//

import SwiftUI

struct loginview: View {
    @StateObject var viewmodel=loginviewmodel()
    
    var body: some View {
        NavigationView{
            VStack{
                //header
                headerview(title: "To Do List", subtitle: "Get things Done", angle: 15, backgroundc: .pink)
                //form
                
                Form{
                    if !viewmodel.errormessage.isEmpty{
                        Text(viewmodel.errormessage)
                            .foregroundColor(.red)
                    }
                    TextField("Email_address",text: $viewmodel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    SecureField("password",text: $viewmodel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    button_custom(title: "Log in", background: .blue) {
                        //attempt log in
                        viewmodel.login()
                    }
                }.offset(y:-50)
                //create account
                VStack{
                    Text("new around here?")
                        //show registration
                        NavigationLink("create an account ", destination: register_view())
                }
                .padding(.bottom,40)
            }
        }
    }
}

struct loginview_Previews: PreviewProvider {
    static var previews: some View {
        loginview()
    }
}
