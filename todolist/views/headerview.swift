//
//  headerview.swift
//  todolist
//
//  Created by Ritik Raman on 14/07/23.
//

import SwiftUI

struct headerview: View {
    
    let title:String
    let subtitle:String
    let angle:Double
    let backgroundc:Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundc)
                .rotationEffect(Angle(degrees: angle))
            VStack{
                Text(title)
                    .font(.system(size:50))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subtitle)
                    .foregroundColor(Color.white)
            }
            .padding(.top,80)
        }.frame(width: UIScreen.main.bounds.width*3 ,height: 350)
            .offset(y:-150)
        //login form
        
        //create account
    Spacer()
    }
}

struct headerview_Previews: PreviewProvider {
    static var previews: some View {
        headerview(title: "Title", subtitle: "subtitle", angle: 15, backgroundc: .blue)
    }
}
