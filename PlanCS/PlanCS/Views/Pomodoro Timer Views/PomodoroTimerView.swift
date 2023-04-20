//
//  PomodoroTimerView.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/19/23.
//

import SwiftUI

struct PomodoroTimerView: View {
    var body: some View {
        VStack {
            Text("Pomodoro\nTimer")
                .font(Font.bitWise36)
                .foregroundColor(.digiGreen)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            HStack {
                Button() {
                    
                } label: {
                    Text("Short Break")
                }
                .font(.modeSeven24)
                .foregroundColor(.digiGreen)
                .padding(.trailing, 40)
                
                Button() {
                    
                } label: {
                    Text("Long Break")
                }
                .font(.modeSeven24)
                .foregroundColor(.digiGreen)
            }
            
            Spacer()
            
            Text("25:00")
                .font(.digitalNumbers64)
                .foregroundColor(.digiRed)
            
            Spacer()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

struct PomodoroTimerView_Previews: PreviewProvider {
    static var previews: some View {
        PomodoroTimerView()
    }
}
