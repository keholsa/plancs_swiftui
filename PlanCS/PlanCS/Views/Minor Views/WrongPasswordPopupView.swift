//
//  WrongPasswordPopupView.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/20/23.
//

import SwiftUI

struct WrongPasswordPopupView: View {
    
    @Binding var state:Int
    
    var body: some View {
        
        Button() {
            state = 0
        } label: {
            Text("Incorrect Password")
        }
        .frame(width: 250, height: 100)
        .font(.bitWise24)
        .background(Color.init(red: 0.2, green: 0.2, blue: 0.2))
        .foregroundColor(.digiGreen)
        .cornerRadius(25)
        
    }
}

struct WrongPasswordPopupView_Previews: PreviewProvider {
    static var previews: some View {
        WrongPasswordPopupView(state: Binding.constant(2))
    }
}
