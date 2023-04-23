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
                        NavigationLink(destination: CalendarEventListView()) {
                            VStack {
                                Image("calendarImage")
                                    .resizable()
                                    .foregroundColor(.digiGreen)
                                    .frame(width: 100, height: 100)
                                Text("Calendar")
                                    .foregroundColor(.white)
                            }
                                .frame(width: 165, height: 165)
                                .font(.modeSeven16)
                                .background(Color.digiGray)
                                .cornerRadius(25)
                        }
                        
                        NavigationLink(destination: ForumsTopView().environmentObject(ForumModel())) {
                            VStack {
                                Image("forumsImage")
                                    .resizable()
                                    .foregroundColor(.digiGreen)
                                    .frame(width: 100, height: 100)
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
                                    .resizable()
                                    .foregroundColor(.digiGreen)
                                    .frame(width: 100, height: 100)
                                Text("Pomodoro\nTimer")
                                    .foregroundColor(.white)
                            }
                                .frame(width: 165, height: 165)
                                .font(.modeSeven16)
                                .background(Color.digiGray)
                                .cornerRadius(25)
                        }
                        
                        NavigationLink(destination: SelectionView()) {
                            VStack {
                                Image("songsImage")
                                    .resizable()
                                    .foregroundColor(.digiGreen)
                                    .frame(width: 100, height: 100)
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
