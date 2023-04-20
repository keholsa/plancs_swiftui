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
                    ForEach(0..<replies.count) { i in
                        Text("\(replies[i].replyingUser): \(replies[i].replyText)")
                            .font(.modeSeven20)
                            .foregroundColor(.digiGreen)
                    }
                }
            }
            
            Spacer()
            
            Button() {
                
            } label: {
                Text("Add comment")
            }
            .frame(width: 240, height: 48)
            .font(.bitWise24)
            .background(Color.digiGray)
            .cornerRadius(32)
            .foregroundColor(.digiGreen)
//            .padding(.vertical, 24)
        }
        .padding(.leading, 20)
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
