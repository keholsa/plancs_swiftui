//
//  MainMenuView.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/19/23.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        
        NavigationStack {
            VStack {
                Spacer()
                
                Grid(alignment: .center, horizontalSpacing: 24, verticalSpacing: 24) {
                    
                    GridRow {
                        NavigationLink(destination: CalendarEventView()) {
                            VStack {
                                Image("calendarImage")
                                    .foregroundColor(.digiGreen)
                                Text("Calendar")
                                    .foregroundColor(.white)
                            }
                                .frame(width: 165, height: 165)
                                .font(.modeSeven16)
                                .background(Color.digiGray)
                                .cornerRadius(25)
                        }
                        
                        NavigationLink(destination: ForumsTopView()) {
                            VStack {
                                Image("forumsImage")
                                    .foregroundColor(.digiGreen)
                                Text("Forums")
                                    .foregroundColor(.white)
                            }
                                .frame(width: 165, height: 165)
                                .font(.modeSeven16)
                                .background(Color.digiGray)
                                .cornerRadius(25)
                        }
                    }
                    
                    GridRow {
                        NavigationLink(destination: PomodoroTimerView()) {
                            VStack {
                                Image("timerImage")
                                    .foregroundColor(.digiGreen)
                                Text("Pomodoro\nTimer")
                                    .foregroundColor(.white)
                            }
                                .frame(width: 165, height: 165)
                                .font(.modeSeven16)
                                .background(Color.digiGray)
                                .cornerRadius(25)
                        }
                        
                        NavigationLink(destination: SongSuggestionsView()) {
                            VStack {
                                Image("songsImage")
                                    .foregroundColor(.digiGreen)
                                Text("Song\nSuggestions")
                                    .foregroundColor(.white)
                            }
                                .frame(width: 165, height: 165)
                                .font(.modeSeven16)
                                .background(Color.digiGray)
                                .cornerRadius(25)
                        }
                        .navigationBarBackButtonHidden(true)
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                Text("PlanCS")
                                    .font(.bitWise36)
                                    .foregroundColor(.digiGreen)
                            }
                        }
                    }
                }
                .padding(.bottom, 100)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
