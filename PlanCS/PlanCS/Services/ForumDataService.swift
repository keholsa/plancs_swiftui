//
//  ForumDataService.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/19/23.
//

import Foundation

class ForumDataService {
    
    static func getLocalData() -> [Forum] {
        
        let pathString = Bundle.main.path(forResource: "forums", ofType: "json")
        
        guard pathString != nil else {
            return [Forum]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            do {
                let forumData = try decoder.decode([Forum].self, from: data)
                
                for u in forumData {
                    u.id = UUID()
                    
                    if let replies = u.replies {
                        
                        for i in replies {
                            i.id = UUID()
                        }
                    }
                        
                }
                
                return forumData
            }
            catch {
                print(error)
            }
        }
        
        catch {
            print(error)
        }
        
        return [Forum]()
    }
    
}
