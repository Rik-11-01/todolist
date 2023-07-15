//
//  extension.swift
//  todolist
//
//  Created by Ritik Raman on 15/07/23.
//

import Foundation

extension Encodable{
    func asdictionary()->[String:Any]{
        guard let data = try?JSONEncoder().encode(self)else{
            return [:]
        }
        do{
            let json = try JSONSerialization.jsonObject(with: data) as?[String:Any]
            return json ?? [:]
        }catch{
            return [:]
        }
    }
}
