//
//  LoggedInSuccessPopupView.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/20/23.
//

import SwiftUI

struct LoggedInSuccessPopupView: View {
    
    @Binding var state:Int
    
    var body: some View {

        NavigationLink(destination: MainMenuView()) {
            
            Text("Logged In")
                .frame(width: 250, height: 100)
                .font(.bitWise24)
                .background(Color.init(red: 0.2, green: 0.2, blue: 0.2))
                .foregroundColor(.digiGreen)
                .cornerRadius(25)
            
        }
    }
}

struct LoggedInSuccessPopupView_Previews: PreviewProvider {
    static var previews: some View {
        LoggedInSuccessPopupView(state: Binding.constant(1))
    }
}
