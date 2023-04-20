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
                    
//                    for i in u.localCalendarEvents {
//                        i.id = UUID()
//                    }
                        
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
    
}
