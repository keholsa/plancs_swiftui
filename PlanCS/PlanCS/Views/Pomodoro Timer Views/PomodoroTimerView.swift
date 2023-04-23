//
//  PomodoroTimerView.swift
//  PlanCS
//
//  Created by Fero Zubek on 4/19/23.
//

import SwiftUI

struct PomodoroTimerView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    //Timer stuff
    @State private var timeRemaining = 1500
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var isRunning = false
    @State private var isWorkSession = true
    
    var body: some View {
            NavigationStack {
                VStack {
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            if !isRunning {
                                isWorkSession = false
                                timeRemaining = 300 // Set timer to 5 minutes
                                timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                                isRunning = true
                            }
                        }) {
                            Text("Short Break")
                        }
                        .font(.modeSeven24)
                        .foregroundColor(.digiGreen)
                        .padding(.trailing, 40)
                        
                        Button(action: {
                            if !isRunning {
                                isWorkSession = false
                                timeRemaining = 900 // Set timer to 15 minutes
                                timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                                isRunning = true
                            }
                        }) {
                            Text("Long Break")
                        }
                        .font(.modeSeven24)
                        .foregroundColor(.digiGreen)
                    }
                    
                    Spacer()
                    
                    Text(String(format: "%02d:%02d", timeRemaining / 60, timeRemaining % 60))
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
                .onReceive(timer) { _ in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    } else {
                        timer.upstream.connect().cancel()
                        isRunning = false
                        isWorkSession.toggle()
                        timeRemaining = isWorkSession ? 1500 : 300 // Start a new session with the appropriate time
                        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        isRunning = true
                    }
                }
            }
        }
    }

    struct PomodoroTimerView_Previews: PreviewProvider {
        static var previews: some View {
            PomodoroTimerView()
        }
    }

   
