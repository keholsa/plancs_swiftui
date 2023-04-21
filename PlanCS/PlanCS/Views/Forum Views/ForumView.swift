//
//  ForumView.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/19/23.
//

import SwiftUI

struct ForumView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

//    @EnvironmentObject var forum:Forum
    @State var title:String = "Forums"
    @State private var commentText: String = ""
    
    @Binding var forum:Forum
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Title: \(forum.title)")
                .font(.modeSeven20)
                .foregroundColor(.digiGreen)
                .padding(.vertical, 10)
            
            Text("Description: \(forum.description)")
                .font(.modeSeven20)
                .foregroundColor(.digiGreen)
                .padding(.bottom, 30)
            
            if let replies = forum.replies {
                LazyVGrid(columns: [GridItem(spacing: 0)], alignment: .leading, spacing: 15) {
                    ForEach(replies) { reply in
                                Text("\(reply.replyingUser): \(reply.replyText)")
                                    .font(.modeSeven20)
                                    .foregroundColor(.digiGreen)
//                    ForEach(0..<replies.count) { i in
//                        Text("\(replies[i].replyingUser): \(replies[i].replyText)")
//                            .font(.modeSeven20)
//                            .foregroundColor(.digiGreen)
                    }
                }
            }
            
            Spacer()
            VStack {
                TextField("write your comment", text: $commentText, onCommit: {
                    if !commentText.isEmpty {
                        let newReply = ForumPostReply(replyingUser: "User", replyText: commentText)
                        forum.replies?.append(newReply)
                        commentText = ""
                    }
                })
                .font(.modeSeven20)
                .foregroundColor(.digiGreen)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.trailing, 8)
                
                Button(action: {
                    if !commentText.isEmpty {
                        let newReply = ForumPostReply(replyingUser: "User", replyText: commentText)
                        forum.replies?.append(newReply)
                        commentText = ""
                    }
                }) {
                    Text("Add comment")
                }
                .frame(width: 240, height: 48)
                .font(.bitWise24)
                .background(Color.digiGray)
                .cornerRadius(32)
                .foregroundColor(.digiGreen)
            }
            .padding(.bottom, 24)
//            Button() {
//
//            } label: {
//                Text("Add comment")
//            }
//            .frame(width: 240, height: 48)
//            .font(.bitWise24)
//            .background(Color.digiGray)
//            .cornerRadius(32)
//            .foregroundColor(.digiGreen)
//            .padding(.vertical, 24)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action : { self.mode.wrappedValue.dismiss() })
            {
                Text("<")
                    .font(.modeSeven36)
                    .foregroundColor(.digiGreen)
                    .padding(.leading, 15)
            })
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Forums")
                    .font(.bitWise36)
                    .foregroundColor(.digiGreen)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

//struct ForumView_Previews: PreviewProvider {
//    static var previews: some View {
//        ForumView(forum: Binding.constant(""))
//    }
//}
