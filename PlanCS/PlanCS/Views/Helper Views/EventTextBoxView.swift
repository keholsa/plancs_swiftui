//
//  EventTextBoxView.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/19/23.
//

import SwiftUI

struct EventTextBoxView: View {
    
    @Binding var eventName:String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.digiGray)
                .cornerRadius(10)
                .frame(width: 344, height: 64)

            Text(eventName)
                .font(.modeSeven24)
                .foregroundColor(.white)
                .padding(.leading, 8)
        }
    }
}

struct EventTextBoxView_Previews: PreviewProvider {
    static var previews: some View {
        EventTextBoxView(eventName: Binding.constant("Event Name"))
    }
}
