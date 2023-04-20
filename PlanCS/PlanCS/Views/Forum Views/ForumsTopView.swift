//
//  ForumsTopView.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/19/23.
//

import SwiftUI

struct ForumsTopView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    @EnvironmentObject var model: ForumModel
    @State var title = "Forums"

    var body: some View {
        NavigationStack {
            VStack {
                
                Grid(alignment: .leading) {
//                    ForEach(0..<model.forums.count) { i in
                        
  //                      NavigationLink(destination: ForumView(forum: $model.forums[i])) {
                    ForEach(model.forums) { forum in
                        NavigationLink(destination: ForumView(forum: Binding(get: { forum }, set: { _ in }))) {
                            Text(forum.title)
                            //Text(model.forums[i].title)
                                .font(.modeSeven20)
                                .foregroundColor(.digiGreen)
                                .padding(.leading, 10)
                                .padding(.vertical, 8)
                                .frame(width: 400, alignment: .leading)
                        }
                    }
                }
                .padding(.top, 10)
                .scaledToFill()
                
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                HStack {
                    Button(action : { self.mode.wrappedValue.dismiss() })
                    {
                        Text("<")
                            .font(.modeSeven36)
                            .foregroundColor(.digiGreen)
                            .padding(.leading, 15)
                    }
                    
                    Spacer()
                    
                    Text("Forums")
                        .font(.bitWise36)
                        .foregroundColor(.digiGreen)
                
                NavigationLink(destination: CreateForumView(forumTitle: "", onPost: { newForum in model.forums.append(newForum)}).environmentObject(model)) {
                        Text("+")
                            .font(.modeSeven36)
                            .foregroundColor(.digiGreen)
                    }
                }
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
        }
    }
}

struct ForumsTopView_Previews: PreviewProvider {
    static var previews: some View {
        ForumsTopView()
            .environmentObject(ForumModel())
    }
}
