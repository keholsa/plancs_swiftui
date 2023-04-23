//
//  LoginFormView.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/19/23.
//

import SwiftUI

struct LoginFormView: View {
    
    @Binding var username:String
    @Binding var password:String
    
    var body: some View {
        Grid(alignment: .center, horizontalSpacing: 0, verticalSpacing: 24) {
            GridRow {
                VStack(alignment: .leading) {
                    Text("Username")
                        .font(.modeSeven24)
                        .foregroundColor(.digiGreen)
                        .padding(.leading, 10.0)
                        .padding(.vertical, -7)
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.digiGray)
                            .cornerRadius(15)
                            .frame(width: 266, height: 40)
                            
                        TextField("", text: $username)
                            .frame(width: 240, height: 40)
                            .font(.modeSeven16)
                            .foregroundColor(.white)
                            .keyboardType(.default)
                            .disableAutocorrection(true)
                    }
                }
            }
            
            GridRow {
                VStack(alignment: .leading) {
                    Text("Password")
                        .font(.modeSeven24)
                        .foregroundColor(.digiGreen)
                        .padding(.leading, 10.0)
                        .padding(.bottom, -7)
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.digiGray)
                            .cornerRadius(15)
                            .frame(width: 266, height: 40)
                            
                        SecureField("", text: $password)
                            .frame(width: 240, height: 40)
                            .font(.modeSeven16)
                            .foregroundColor(.white)
                            .keyboardType(.default)
                            .disableAutocorrection(true)
                    }
                }
            }
        }
    }
}

struct LoginFormView_Previews: PreviewProvider {
    static var previews: some View {
        LoginFormView(username: Binding.constant(""), password: Binding.constant(""))
    }
}
