//
//  ListView.swift
//  PlanCS_Calendar
//
//  Created by Makenzie Terrell 
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var appEvents: CalendarFunctions
    @State private var formType: EventFormType?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(appEvents.events.sorted {$0.date < $1.date }) { event in
                    RowView(event: event, formType: $formType)
                        .swipeActions {
                            Button(role: .destructive) {
                                appEvents.deleteEvent(event)
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                }
            }
//
//            // Upcoming Events Text
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    Text("Upcoming Events")
//                        .font(.largeTitle)
//                        .foregroundColor(.green)
//                    //.font(Font.modeSeven30)
//                    //.foregroundColor(.digiGreen)
//                }
//            }
//            
//            .sheet(item: $formType) { $0 }
//            .toolbar {
//                ToolbarItem(placement: .bottomBar) {
//                    Button {
//                        formType = .new
//                    } label: {
//                        Text("Add Event")
//                            .foregroundColor(.green)
//                            .font(.largeTitle)
//                        //.font(Font.modeSeven30)
//                        //.foregroundColor(.digiGreen)
//                        //.background(.digiGray)
//
//                    }
//                }
//            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(CalendarFunctions(preview: true))
    }
}
