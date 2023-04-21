//
//  CreateForumView.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/19/23.
//

import SwiftUI

struct CreateForumView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var forumModel: ForumModel
    
//    @State var title:String = "Forums"
    @State var forumTitle:String
    @State var forumDescription: String = ""
    
    var onPost: ((Forum) -> Void)?
    
    private func postForum() {
        let newForum = Forum(title: forumTitle, description: forumDescription, poster: "User")
        onPost?(newForum)
        presentationMode.wrappedValue.dismiss()
    }

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
            
            HStack {
                Text("Description: ")
                    .font(.modeSeven20)
                    .foregroundColor(.digiGreen)
                    .padding(.leading, 10)
                
                TextField("enter description here", text: $forumDescription)
                    .font(.modeSeven20)
                    .foregroundColor(.digiGreen)
                    .keyboardType(.default)
            }
            
            Spacer()
                        
            Button(action: postForum) {
                Text("Post")
                    .frame(width: 240, height: 48)
                    .font(.bitWise24)
                    .background(Color.digiGray)
                    .cornerRadius(32)
                    .foregroundColor(.digiGreen)
            }
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action : { self.presentationMode.wrappedValue.dismiss() }) {
                Text("<")
                    .font(.modeSeven36)
                    .foregroundColor(.digiGreen)
                    .padding(.leading, 15)
                }
            )
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Create Forum")
                    .font(.bitWise36)
                    .foregroundColor(.digiGreen)
            }
        }
    }
}

struct CreateForumView_Previews: PreviewProvider {
    static var previews: some View {
        CreateForumView(forumTitle: "")
            .environmentObject(ForumModel())
    }
}
