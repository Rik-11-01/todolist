//
//  button_custom.swift
//  todolist
//
//  Created by Ritik Raman on 14/07/23.
//

import SwiftUI

struct button_custom: View {
    let title :String
    let background:Color
    let action:()->Void
    var body: some View {
            Button {
                //Action
                action()
                
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(background)
                    Text(title)
                        .foregroundColor(.white)
                        .bold()
                }
            }
    }
}

struct button_custom_Previews: PreviewProvider {
    static var previews: some View {
        button_custom(title: "log in", background: .blue){
            
        }
    }
}
