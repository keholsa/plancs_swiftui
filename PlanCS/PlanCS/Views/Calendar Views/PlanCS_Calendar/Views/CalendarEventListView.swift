//
//  CalendarEventListView.swift
//  PlanCS_Calendar
//
//  Created by Makenzie Terrell 
//

import SwiftUI

struct CalendarEventListView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    @EnvironmentObject var myEvents: CalendarFunctions
    @State private var formType: EventFormType?

    let todaysDate = Date()

    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                
                Spacer()
                
                Text(todaysDate.formatted(date: .long, time: .omitted))
                    .font(Font.modeSeven36)
                    .foregroundColor(.digiGreen)
                    .padding(.bottom, 24)

                Text("Upcoming Events")
                    .font(Font.modeSeven30)
                    .foregroundColor(.digiGreen)
                    .padding(.bottom, 18)
                
                ListView()
                    .padding(.bottom, 50)
                        
            }
            .preferredColorScheme(.dark)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                self.mode.wrappedValue.dismiss()
            }){
                Text("<")
                    .font(.modeSeven36)
                    .foregroundColor(.digiGreen)
                    .padding(.leading, 15)
            })
            
            .sheet(item: $formType) { $0 }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Calendar")
                        .font(.bitWise36)
                        .foregroundColor(.digiGreen)
                }
                ToolbarItem(placement: .bottomBar) {
                    HStack(spacing: 50) {

                        Button {
                            formType = .new
                        }
                        label: {
                            Text("Add Event")
                                .frame(width: 112, height: 80)
                                .font(.bitWise24)
                                .background(Color.digiGray)
                                .cornerRadius(15)
                                .foregroundColor(.digiGreen)
                        }
                        
                        NavigationLink(destination: TraditionalCalendarView()) {
                            Image("calendarImage")
                                .frame(width: 112, height: 80)
                                .background(Color.digiGray)
                                .cornerRadius(15)
                                .foregroundColor(.digiGreen)
                        }
                        
                        .navigationBarBackButtonHidden(true)
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
                                Text("Calendar")
                                    .font(.bitWise36)
                                    .foregroundColor(.digiGreen)
                            
                            }
                        }
                    }
                }
            }
        
            Spacer()
        }
        .preferredColorScheme(.dark)
    }
}

struct CalendarEventListView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarEventListView()
            .environmentObject(CalendarFunctions(preview: true))
    }
}
