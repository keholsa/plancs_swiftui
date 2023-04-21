//
//  UserModel.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/20/23.
//

import Foundation

class UserModel:ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        
        self.users = UserDataService.getLocalData()
        print(self.users)
    }
    
    // 0 = base state; 1 = user found/login; 2 = wrong password; 3 = user not found
    static func getUser(users:[User], username:String, password:String) -> Int {
        print("searching for \(username) with password \(password)")
        
        if username != "" && password != "" {
            print("username and password is not blank, number of users is \(users.count)")
            
            for i in 0..<users.count {
                print("looking at user \(users[i])")
                
                if users[i].username == username {
                    print("found user")
                    
                    if users[i].password == password { return 1 }
                    else { return 2 }
                }
            }
            return 3
        }
        return 0
    }
}
