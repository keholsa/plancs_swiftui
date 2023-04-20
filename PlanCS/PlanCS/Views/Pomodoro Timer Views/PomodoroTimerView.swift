//
//  PomodoroTimerView.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/19/23.
//

import SwiftUI

struct PomodoroTimerView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        NavigationStack {
            VStack {
                Text("")
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
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action : {
                self.mode.wrappedValue.dismiss()
            }){
                Text("<")
                    .font(.modeSeven36)
                    .foregroundColor(.digiGreen)
                    .padding(.leading, 15)
            })
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Pomodoro Timer")
                            .multilineTextAlignment(.center)
                            .font(.bitWise36)
                            .foregroundColor(.digiGreen)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
        }
    }
}

struct PomodoroTimerView_Previews: PreviewProvider {
    static var previews: some View {
        PomodoroTimerView()
    }
}
