//
//  LoginView.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/16/23.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var model: UserModel

    @State var username:String = ""
    @State var password:String = ""
    
    // 0 = base state; 1 = user found/login; 2 = wrong password; 3 = user not found
    @State var loginState:Int = 0
    

    var body: some View {
        
        NavigationStack {
            ZStack {
                VStack {
                    
                    Text("Create\naccount/login")
                        .font(.modeSeven28)
                        .foregroundColor(.digiGreen)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                        .padding(.top, 140)
                    
                    VStack(alignment: .trailing) {

                        LoginFormView(username: $username, password: $password)
                            .padding(.bottom, 40)
                        
                        Button() {
                            loginState = UserModel.getUser(users: model.users, username: username, password: password)
                        } label: {
                            Text("Login")
                                .frame(width: 112, height: 40)
                                .font(.bitWise24)
                                .background(Color.digiGray)
                                .cornerRadius(15)
                                .foregroundColor(.digiGreen)
                        }
                        Spacer()
                        NavigationLink(destination: MainMenuView()) {
                            Text("Continue as guest")
                                .frame(width: 180, height: 30)
                                .font(.bitWise16)
                                .background(Color.digiGray)
                                .cornerRadius(15.0)
                                .foregroundColor(.digiGreen)
//                                .padding(.top, 72)
                        }
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                Text("PlanCS")
                                    .font(.bitWise36)
                                    .foregroundColor(.digiGreen)
                            }
                        }
                        
                        Spacer()
                        Spacer()
                    }
                    .frame(width: 266)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black)
                
                if loginState == 1 {
                    LoggedInSuccessPopupView(state: $loginState)
                }
                
                else if loginState == 2 {
                    WrongPasswordPopupView(state: $loginState)
                }
                
                else if loginState == 3 {
                    CreateAccountPopupView(state: $loginState, username: $username, password: $password)
                }
            }
        }
        .environmentObject(ForumModel())
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
