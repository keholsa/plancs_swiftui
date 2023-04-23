//
//  DaysEventView.swift
//  PlanCS_Calendar
//
//  Created by Makenzie Terrell 
//

import SwiftUI

struct DaysEventView: View {
    @EnvironmentObject var calendarFunctions: CalendarFunctions
    @Binding var dateSelected: DateComponents?
    @State private var formType: EventFormType?
    
    var body: some View {
        NavigationStack {
            Group {
                if let dateSelected {
                    let foundEvents = calendarFunctions.events
                        .filter { $0.date.startOfDay == dateSelected.date!.startOfDay }
                    List {
                        // Attaches swipe action to delete a row
                        ForEach(foundEvents) { event in
                            RowView(event: event, formType: $formType)
                                .swipeActions {
                                    Button(role: .destructive) {
                                        calendarFunctions.deleteEvent(event)
                                    } label: { Image(systemName: "trash") }
                                }
                                .sheet(item: $formType) { $0 }
                        }
                    }
                }
            }
            
            .navigationTitle(dateSelected?.date?.formatted(date: .long, time: .omitted) ?? "")
        }
    }
}

struct DaysEventView_Previews: PreviewProvider {
    static var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: Date())
        dateComponents.timeZone = TimeZone.current // Gets time zone
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }
    
    static var previews: some View {
        DaysEventView(dateSelected: .constant(dateComponents))
            .environmentObject(CalendarFunctions(preview: true))
    }
}
