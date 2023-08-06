//
//  newitemview.swift
//  todolist
//
//  Created by Ritik Raman on 14/07/23.
//

import SwiftUI

struct newitemview: View {
    @StateObject var viewmodel = newitemviewmodel()
    @Binding var newitempresented: Bool
    var body: some View {
        ZStack{
//            LinearGradient(gradient: Gradient(colors: [Color.blue,Color.white.opacity(0.0)]), startPoint: .top, endPoint: .bottom)
//                .blur(radius: 100)
            VStack{
                Text("new item")
                    .bold()
                    .font(.system(size: 32))
                    .padding(.top,100)
                Form{
                    //title
                    TextField("Title",text:$viewmodel.title)
                        .textFieldStyle(.roundedBorder)
                    //due date
                    DatePicker("Due date", selection:$viewmodel.duedate)
                        .datePickerStyle(.graphical)
                    //button
                    button_custom(title: "save", background: .pink) {
                        if viewmodel.cansave{
                            viewmodel.save()
                            newitempresented=false
                        }else{
                            viewmodel.showalert=true
                        }
                    }
        
                    .padding( )
                }
                .alert(isPresented: $viewmodel.showalert) {
                    Alert(title:Text( "Error"),message: Text("please fill in all"))
                }
            }
        }
    }
}

struct newitemview_Previews: PreviewProvider {
    static var previews: some View {
        newitemview(newitempresented: Binding(get: {
            return true
        }, set: { _  in
            
        }))
    }
}
