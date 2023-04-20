//
//  User.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/19/23.
//

import Foundation

class User: Identifiable, Decodable {
    
    var id:UUID?
    var username:String
    var password:String
    
}
