//
//  User.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/19/23.
//

import Foundation

class User: Identifiable, Codable {
    
    var id:UUID?
    var username:String
    var password:String
    
    init() {
        id = UUID()
        username = "Anonymous User"
        password = ""
    }
    
    init(username:String, password:String) {
        id = UUID()
        self.username = username
        self.password = password
    }
}

struct newUser: Identifiable, Encodable {
    var id:UUID?
    var username:String
    var password:String
}
