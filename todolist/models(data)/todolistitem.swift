//
//  todolistitem.swift
//  todolist
//
//  Created by Ritik Raman on 14/07/23.
//

import Foundation

struct todolistitem:Codable,Identifiable{
    let id:String
    let title:String
    let duedate:TimeInterval
    let createddate:TimeInterval
    var isdone:Bool
    
    mutating func setdone(_ state:Bool){
        isdone=state
    }
    
}
