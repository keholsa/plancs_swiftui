//
//  TraditionalCalendarView.swift
//  PlanCS_Calendar
//
//  Created by Makenzie Terrell
//

import SwiftUI

struct TraditionalCalendarView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @EnvironmentObject var myEvents: CalendarFunctions
    @State private var formType: EventFormType?
    
    let todaysDate = Date()
    
    var body: some View {
        NavigationStack {
            
            Spacer()
            
            CalendarEventView()
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
                        }
                    }
                }
        }
        .preferredColorScheme(.dark)
    }
}

struct TraditionalCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        TraditionalCalendarView()
            .environmentObject(CalendarFunctions(preview: true))
    }
}
