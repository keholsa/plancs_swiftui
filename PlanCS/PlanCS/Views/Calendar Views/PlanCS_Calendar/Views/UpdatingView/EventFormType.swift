//
//  EventFormType.swift
//  PlanCS_Calendar
//
//  Created by Makenzie Terrell 
//

import SwiftUI

enum EventFormType: Identifiable, View {
    case new
    case update(Event)
    var id: String {
        switch self {
        case .new:
            return "new"
        case .update:
            return "update"
        }
    }

    var body: some View {
        switch self {
        case .new:
            return EventFormView(viewModel: EventViewModel())
        case .update(let event):
            return EventFormView(viewModel: EventViewModel(event))
        }
    }
}
