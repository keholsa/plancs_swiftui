//
//  RowView.swift
//  PlanCS_Calendar
//
//  Created by Makenzie Terrell
//

import SwiftUI

struct RowView: View {
    let event: Event
    @Binding var formType: EventFormType?
    var body: some View {
        ZStack {
            
            Rectangle()
                .foregroundColor(.digiGray)
                .cornerRadius(10)
                .frame(width: 344, height: 64)
            
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text(event.eventType.icon)
                            .font(.system(size: 40))
                        Text(event.note)
                    }
                    Text(
                        event.date.formatted(date: .abbreviated,
                                             time: .shortened)
                    )
                }
                
                Spacer()
                
                Button {
                    formType = .update(event)
                } label: {
                    Text("Edit")
                }
                .buttonStyle(.bordered)
            }
            .frame(width: 324, height: 64)
            .padding(.bottom, 7)

//            .frame(maxWidth: .infinity, maxHeight: .infinity)
            //        .background(.black)
            .font(Font.modeSeven16)
            .foregroundColor(.digiGreen)
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static let event = Event(eventType: .fun, date: Date(), note: "Game Night")
    
    static var previews: some View {
        RowView(event: event, formType: .constant(.new))
    }
}
