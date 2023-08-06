//
//  todolistview.swift
//  todolist
//
//  Created by Ritik Raman on 14/07/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct todolistview: View {
    @StateObject var viewmodel:todolistviewmodel
    @FirestoreQuery var items : [todolistitem]
    
    init(userId:String){
        
        self._items = FirestoreQuery(collectionPath: "user/\(userId)/todos")
        self._viewmodel=StateObject(wrappedValue: todolistviewmodel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    todolistitemview(item: item)
                        .swipeActions {
                            Button {
                                //delete
                                viewmodel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                                    
                            }.tint(.red)

                        }
                }.listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    //action
                    viewmodel.showingnewitemview=true
                } label: {
                    Image(systemName: "plus")
                }
                
            }
            .sheet(isPresented: $viewmodel.showingnewitemview) {
                //
                newitemview(newitempresented:$viewmodel.showingnewitemview)
            }
        }
    }
}

struct todolistview_Previews: PreviewProvider {
    static var previews: some View {
        todolistview(userId: "0KGODLs9WxYe8luODlBlUxQGv0E3")
    }
}
