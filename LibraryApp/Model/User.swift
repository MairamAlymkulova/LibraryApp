//
//  User.swift
//  LibraryApp
//
//  Created by A Mairam on 13/12/23.
//

import Foundation

struct Usser: Identifiable{
    var id: String = UUID().uuidString
    var name: String
    var thirname: String
    var password: String
    
    var representation: [String: Any]{
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["thirname"] = self.thirname
        repres["password"] = self.password
        return repres
    }
    
//    "id": user.id,
//    "name": user.name,
//    "thirname": user.thirname
}
