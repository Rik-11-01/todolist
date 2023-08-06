//
//  todolistitemview.swift
//  todolist
//
//  Created by Ritik Raman on 14/07/23.
//

import SwiftUI

struct todolistitemview: View {
    @StateObject var viewmodel = todolistitemviewmodel()
    let item:todolistitem
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.duedate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewmodel.toggleIsDone(item:item)
            } label: {
                Image(systemName: item.isdone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            }

        }
    }
}

struct todolistitemview_Previews: PreviewProvider {
    static var previews: some View {
        todolistitemview(item: .init( id: "123", title: "milk", duedate: Date().timeIntervalSince1970, createddate: Date().timeIntervalSince1970, isdone: true))
    }
}
