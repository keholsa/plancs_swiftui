//
//  Event.swift
//  PlanCS_Calendar
//
//  Created by Makenzie Terrell 
//

import Foundation

struct Event: Identifiable {
    enum EventType: String, Identifiable, CaseIterable {
        case work, fun, urgent, other // event cases
        var id: String {
            self.rawValue
        }
        
        // event case icons
        var icon: String {
            switch self {
            case .work:
                return "💻"
            case .fun:
                return "🎮"
            case .urgent:
                return "‼️"
            case .other:
                return "📌"
            }
        }
    }
    
    var eventType: EventType
    var date: Date
    var note: String
    var id: String
    
    var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        dateComponents.timeZone = TimeZone.current // Gets time zone
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }
    
    init(id: String = UUID().uuidString, eventType: EventType = .other, date: Date, note: String) {
        self.eventType = eventType
        self.date = date
        self.note = note
        self.id = id
    }
    
    //Test Cases
     static var testEvents: [Event] {
         return [
            Event(eventType: .work, date: Date().diff(numDays: 6), note: "Meeting"),
            Event(eventType: .fun, date: Date().diff(numDays: -1), note: "Game Night"),
            Event(eventType: .urgent, date: Date().diff(numDays: 2), note: "Application Due"),
            Event(date: Date().diff(numDays: -4), note: "Dentist Appointment.")
         ]
    }
}

