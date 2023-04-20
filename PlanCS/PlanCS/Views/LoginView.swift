//
//  LoginView.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/16/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var username:String = ""
    @State var password:String = ""

    var body: some View {
        
        ZStack {
            NavigationStack {
                VStack {
//                    Text("PlanCS")
//                        .font(Font.bitWise36)
//                        .foregroundColor(.digiGreen)
//
                    Spacer()
//
                    Text("Create\naccount/login")
                        .font(.modeSeven28)
                        .foregroundColor(.digiGreen)
                        .multilineTextAlignment(.center)
                        .padding(.vertical)
                    
                    VStack(alignment: .trailing) {

                        LoginFormView(username: $username, password: $password)
                            .padding(.bottom, 40)
                        
                        NavigationLink(destination: MainMenuView()) {
                            Text("Login")
                                .frame(width: 112, height: 40)
                                .font(.bitWise24)
                                .background(Color.digiGray)
                                .cornerRadius(15)
                                .foregroundColor(.digiGreen)
                        }
                        
                        NavigationLink(destination: MainMenuView()) {
                            Text("Continue as guest")
                                .frame(width: 180, height: 30)
                                .font(.bitWise16)
                                .background(Color.digiGray)
                                .cornerRadius(15.0)
                                .foregroundColor(.digiGreen)
                                .padding(.top, 72)
                        }
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                Text("PlanCS")
                                    .font(.bitWise36)
                                    .foregroundColor(.digiGreen)
                            }
                        }
                    }
                    .frame(width: 266)
                    
                    Spacer()
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
