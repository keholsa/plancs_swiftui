//
//  CreateAccountPopupView.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/20/23.
//

import SwiftUI

struct CreateAccountPopupView: View {
    
    @Binding var state:Int
    @Binding var username:String
    @Binding var password:String

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 250, height: 100)
                .foregroundColor(Color.init(red: 0.2, green: 0.2, blue: 0.2))
                .cornerRadius(25)
            
            VStack {
                
                Text("User doesn't exist\nCreate account?")
                    .font(.modeSeven18)
                    .foregroundColor(.digiGreen)
                    .multilineTextAlignment(.center)
                
                HStack {
                    NavigationLink(destination: MainMenuView()) {
                        Button() {
                            UserDataService.addUser(username: username, password: password)
                            state = 1
                        } label: {
                            Text("Yes")
                                .frame(width: 112, height: 40)
                                .font(.bitWise24)
                                .background(Color.digiGray)
                                .cornerRadius(15)
                                .foregroundColor(.digiGreen)
                        }
                    }
                    
                    Button() {
                        state = 0
                    } label: {
                        Text("No")
                            .frame(width: 112, height: 40)
                            .font(.bitWise24)
                            .background(Color.digiGray)
                            .cornerRadius(15)
                            .foregroundColor(.digiGreen)
                    }
                }
            }
        }
    }
}

struct CreateAccountPopupView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountPopupView(state: Binding.constant(3), username: Binding.constant("Jonathan"), password: Binding.constant("1234"))
    }
}
