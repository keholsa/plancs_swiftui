//
//  UserDataService.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/19/23.
//

import Foundation

class UserDataService {
    
    static func getLocalData() -> [User] {
        
        let pathString = Bundle.main.path(forResource: "users", ofType: "json")
        
        guard pathString != nil else {
            return [User]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            do {
                let userData = try decoder.decode([User].self, from: data)
                
                for u in userData {
                    
                    u.id = UUID()

                }
                
                return userData
            }
            catch {
                print(error)
            }
        }
        
        catch {
            print(error)
        }
        
        return [User]()
    }
    
    static func addUser(username:String, password:String) {
        
        let pathString = Bundle.main.path(forResource: "users", ofType: "json")
        
        guard pathString != nil else {
            return
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        var users = getLocalData()
                
        users.append(User(username: username, password: password))
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        do {
            let data = try encoder.encode(users)
            try data.write(to: url)
            print(String(data: data, encoding: .utf8)!)
        }
        catch {
            print(error)
        }

    }
    
}
