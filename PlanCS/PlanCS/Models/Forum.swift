//
//  Forum.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/19/23.
//

import Foundation

class Forum: Identifiable, Decodable {
    
    var id:UUID?
    var title:String
    var description:String
    var poster:String
    var replies:[ForumPostReply]?

    init(id: UUID? = UUID(), title: String, description: String, poster: String, replies: [ForumPostReply]? = []) {
        self.id = id
        self.title = title
        self.description = description
        self.poster = poster
        self.replies = replies
    }
    
}

class ForumPostReply: Identifiable, Decodable {
    
    var id:UUID?
    var replyingUser:String
    var replyText:String
    
}
