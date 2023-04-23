//
//  EventFormView.swift
//  PlanCS_Calendar
//
//  Created by Makenzie Terrell 
//

import SwiftUI

struct EventFormView: View {
    @EnvironmentObject var calendarFunctions: CalendarFunctions
    @StateObject var viewModel: EventViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState private var focus: Bool?
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    DatePicker(selection: $viewModel.date) {
                        Text("Date and Time")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .background(.black)
//                    .foregroundColor(.digiGreen)

                    TextField("Note", text: $viewModel.note, axis: .vertical)
                        .focused($focus, equals: true)
                    Picker("Event Type", selection: $viewModel.eventType) {
                        ForEach(Event.EventType.allCases) {eventType in
                            Text(eventType.icon + " " + eventType.rawValue.capitalized)
                                .tag(eventType)
                        }
                    }
                    
                    Section(footer:
                                HStack {
                        Spacer()
                        Button {
                            if viewModel.updating {
                                // updates the chosen event
                                let event = Event(id: viewModel.id!,
                                                  eventType: viewModel.eventType,
                                                  date: viewModel.date,
                                                  note: viewModel.note)
                                calendarFunctions.updateEvent(event)
                            } else {
                                // creates a new event
                                let newEvent = Event(eventType: viewModel.eventType,
                                                     date: viewModel.date,
                                                     note: viewModel.note)
                                calendarFunctions.addEvent(newEvent)
                            }
                            dismiss()
                        }
                        
                        label: {
                            Text(viewModel.updating ? "Update Event" : "Add Event")
                        }
                        
                        .buttonStyle(.borderedProminent)
                        .disabled(viewModel.incomplete)
                        Spacer()
                    }
                    ) {
                        EmptyView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            
            .navigationTitle(viewModel.updating ? "Update" : "New Event")
            .onAppear {
                focus = true
            }
        }
    }
}

struct EventFormView_Previews: PreviewProvider {
    static var previews: some View {
        EventFormView(viewModel: EventViewModel())
            .environmentObject(CalendarFunctions())
    }
}
