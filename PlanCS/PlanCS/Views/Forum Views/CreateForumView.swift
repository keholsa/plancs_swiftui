//
//  CreateForumView.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/19/23.
//

import SwiftUI

struct CreateForumView: View {
    
//    @State var title:String = "Forums"
    @State var forumTitle:String

    var body: some View {
        VStack {
//            TitleView(title: $title)
            
            HStack {
                Text("Title: ")
                    .font(.modeSeven20)
                    .foregroundColor(.digiGreen)
                    .padding(.leading, 10)
                
                TextField("enter title name here", text: $forumTitle)
                    .font(.modeSeven20)
                    .foregroundColor(.digiGreen)
                    .keyboardType(.default)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

struct CreateForumView_Previews: PreviewProvider {
    static var previews: some View {
        CreateForumView(forumTitle: "Title")
    }
}
