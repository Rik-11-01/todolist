//
//  register view.swift
//  todolist
//
//  Created by Ritik Raman on 14/07/23.
//

import SwiftUI

struct register_view: View {
    @StateObject var viewmodel=registerviewmodel()
    
    var body: some View {
        VStack{
            headerview(title: "Register", subtitle: "organize your work", angle: -15, backgroundc: .orange)
            Spacer()
            Form{
                TextField("Full_name",text:$viewmodel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                TextField("email_address",text:$viewmodel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("password",text:$viewmodel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                button_custom(title: "Register", background: .green) {
                    //register
                    viewmodel.register()
                }
            }.offset(y:-50)
            
        }
    }
}

struct register_view_Previews: PreviewProvider {
    static var previews: some View {
        register_view()
    }
}
