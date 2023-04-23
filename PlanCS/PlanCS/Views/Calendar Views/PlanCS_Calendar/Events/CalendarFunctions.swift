//
//  CalendarFunctions.swift
//  PlanCS_Calendar
//
//  Created by Makenzie Terrell
//

import Foundation

@MainActor
class CalendarFunctions: ObservableObject {
    @Published var events = [Event]()
    @Published var preview: Bool
    @Published var eventChanged: Event?
    @Published var eventMoved: Event?

    init(preview: Bool = false) {
        self.preview = preview
        fetchEvents()
    }

    // Displayes events stored already
    func fetchEvents() {
        if preview {
            events = Event.testEvents
        } else {
            // load from your persistence store
        }
    }
    
    // Deletes an event
    func deleteEvent(_ event: Event) {
        if let index = events.firstIndex(where: {$0.id == event.id}) {
            eventChanged = events.remove(at: index)
        }
    }

    // Adds an event
    func addEvent(_ event: Event) {
        events.append(event)
        eventChanged = event
    }

    // Updates an event
    func updateEvent(_ event: Event) {
        if let index = events.firstIndex(where: {$0.id == event.id}) {
            eventMoved = events[index]
            events[index].date = event.date
            events[index].note = event.note
            events[index].eventType = event.eventType
            eventChanged = event
        }
        
    }

}
