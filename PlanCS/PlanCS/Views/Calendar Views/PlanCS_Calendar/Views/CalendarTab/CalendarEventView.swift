//
//  CalendarEventView.swift
//  PlanCS_Calendar
//
//  Created by Makenzie Terrell
//

import SwiftUI

struct CalendarEventView: View {
    @EnvironmentObject var calendarFunctions: CalendarFunctions
    @State private var dateSelected: DateComponents?
    @State private var displayEvents = false
    @State private var formType: EventFormType?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                CalendarView(timeInterval: DateInterval(start: .distantPast, end: .distantFuture), calendarFunctions: calendarFunctions, dateSelected: $dateSelected, displayEvents: $displayEvents)
                    .frame(width: 400)
            }
            .preferredColorScheme(.dark)
            
            .sheet(item: $formType) { $0 }.foregroundColor(.green)
            .sheet(isPresented: $displayEvents) {
                DaysEventView(dateSelected: $dateSelected)
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

struct CalendarEventView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarEventView()
            .environmentObject(CalendarFunctions(preview: true))
    }
}
