//
//  TitleView.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/19/23.
//

import SwiftUI

struct TitleView: View {
    
    @Binding var title:String
    
    var body: some View {
        ZStack {
            Button() {
                
            } label: {
                Text("<")
            }
            .font(.modeSeven36)
            .foregroundColor(.digiGreen)
            .frame(width: 40, height: 40)
            .padding(.trailing, 338)
            
            Text(title)
                .font(.bitWise36)
                .foregroundColor(.digiGreen)
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: Binding.constant("Title"))
    }
}
