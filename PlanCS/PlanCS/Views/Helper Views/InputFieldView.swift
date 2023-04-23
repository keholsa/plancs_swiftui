//
//  InputFieldView.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/18/23.
//

import SwiftUI

struct InputFieldView: View {
    
    @Binding var inputField: String
    
    var body: some View {
        
        ZStack {
            
//            Rectangle()
//                .foregroundColor(.digiRed)
//                .padding(/*@START_MENU_TOKEN@*/.all, 0.0/*@END_MENU_TOKEN@*/)
//                .cornerRadius(15)
//                .frame(width: 266, height: 40)
                
                
            TextField("", text: $inputField)
                .frame(width: 266, height: 40)
                .background(Color.digiGray)
                .cornerRadius(15)
                .font(.modeSeven16)
                .foregroundColor(.white)
                .keyboardType(.default)
                .onSubmit {
                    
                }
            
        }
    }
}

struct InputFieldView_Previews: PreviewProvider {
    static var previews: some View {
        InputFieldView(inputField: Binding.constant(""))
    }
}
