//
//  CalendarView.swift
//  PlanCS_Calendar
//
//  Created by Makenzie Terrell
//

import SwiftUI

struct CalendarView: UIViewRepresentable {
    let timeInterval: DateInterval
    @ObservedObject var calendarFunctions: CalendarFunctions
    @Binding var dateSelected: DateComponents?
    @Binding var displayEvents: Bool
    
    func makeUIView(context: Context) -> some UICalendarView {
        let view = UICalendarView()
        view.delegate = context.coordinator
//        view.backgroundColor = UIColor.black
        view.tintColor = UIColor.init(red: (5/255), green: (255/255), blue: (0/255), alpha: 1)
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = timeInterval
        let dateSelection = UICalendarSelectionSingleDate(delegate: context.coordinator)
        view.selectionBehavior = dateSelection
        return view
    }
    
    // Updates view if an event is updated on the calendar
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let eventChanged = calendarFunctions.eventChanged {
            uiView.reloadDecorations(forDateComponents: [eventChanged.dateComponents], animated: true)
            calendarFunctions.eventChanged = nil
        }
        
        if let eventMoved = calendarFunctions.eventMoved {
            uiView.reloadDecorations(forDateComponents: [eventMoved.dateComponents], animated: true)
            calendarFunctions.eventMoved = nil
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self, calendarFunctions: _calendarFunctions)
    }
    
    class Coordinator: NSObject, UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
        var parent: CalendarView
        @ObservedObject var calendarFunctions: CalendarFunctions
        
        init(parent:CalendarView, calendarFunctions: ObservedObject<CalendarFunctions>) {
            self.parent = parent
            self._calendarFunctions = calendarFunctions
        }
        
        @MainActor
        func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
            
            let foundEvents = calendarFunctions.events
                .filter { $0.date.startOfDay == dateComponents.date?.startOfDay }
            if foundEvents.isEmpty { return nil }
            
            if foundEvents.count > 1 {
                return .image(UIImage(systemName: "doc.on.doc.fill"),
                              color: .red,
                              size:.large)
            }
            
            let singleEvent = foundEvents.first!
            return .customView {
                let icon = UILabel()
                icon.text = singleEvent.eventType.icon
                return icon
            }
        }
        
        func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
            parent.dateSelected = dateComponents
            guard let dateComponents else { return }
            
            // Displays events
            let foundEvents = calendarFunctions.events
                .filter { $0.date.startOfDay == dateComponents.date?.startOfDay }
            if !foundEvents.isEmpty {
                parent.displayEvents.toggle()
            }
        }
        
        // Makes the dates selectable
        func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
            return true
        }
    }
}
