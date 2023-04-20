//
//  ForumModel.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/19/23.
//

import Foundation

class ForumModel:ObservableObject {
    
    @Published var forums = [Forum]()
    
    init() {
        
        self.forums = ForumDataService.getLocalData()
        
    }
}
