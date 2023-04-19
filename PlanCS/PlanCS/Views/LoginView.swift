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
            NavigationView {
                VStack {
                    Text("Plan CS")
                        .font(Font.bitWise36)
                        .foregroundColor(.digiGreen)
                    
                    Spacer()
                    
                    Text("Create \naccount/login")
                        .font(.modeSeven28)
                        .foregroundColor(.digiGreen)
                        .multilineTextAlignment(.center)
                        .padding(.vertical)
                    
                    VStack(alignment: .trailing) {
                        VStack(alignment: .leading) {
                            
                            Text("Username")
                                .font(.modeSeven24)
                                .foregroundColor(.digiGreen)
                                .padding(.leading, 10.0)
                                .padding(.vertical, -7)
                            
                            InputFieldView(inputField: $username)
                                .padding(.bottom)
                            
                            Text("Password")
                                .font(.modeSeven24)
                                .foregroundColor(.digiGreen)
                                .padding(.leading, 10.0)
                                .padding(.bottom, -7)
                            
                            InputFieldView(inputField: $password)
                            
                        }
                        .padding(.bottom, 40)
                        
                        Button() {
                            
                        } label: {
                            Text("Login")
                        }
                        .frame(width: 112, height: 40)
                        .font(.bitWise24)
                        .background(Color.digiGray)
                        .cornerRadius(15)
                        .foregroundColor(.digiGreen)
                        
                        Button() {
                            
                        } label: {
                            Text("Continue as guest")
                            
                        }
                        .frame(width: 180, height: 30)
                        .font(.bitWise16)
                        .background(Color.digiGray)
                        .cornerRadius(15.0)
                        .foregroundColor(.digiGreen)
                        .padding(.top, 60)
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
