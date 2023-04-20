//
//  CalendarEventView.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/19/23.
//

import SwiftUI

struct CalendarEventView: View {
    
    let todaysDate = Date()
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    @State var title:String = "Calendar"
    
    @State var eventName1:String = "Event 1"
    @State var eventName2:String = "Event 2"
    @State var eventName3:String = "Event 3"
    @State var eventName4:String = "Event 4"
    @State var eventName5:String = "Event 5"

    var body: some View {
        NavigationStack {
            VStack {
//                TitleView(title: $title)
                
                Spacer()
                
                Text(todaysDate.formatted(date: .long, time: .omitted))
                    .font(Font.modeSeven36)
                    .foregroundColor(.digiGreen)
                    .padding(.bottom, 24)
                
                Text("Upcoming Events")
                    .font(Font.modeSeven30)
                    .foregroundColor(.digiGreen)
                    .padding(.bottom, 18)
                
                Grid(alignment: .center, verticalSpacing: 12) {
                    EventTextBoxView(eventName: $eventName1)
                    EventTextBoxView(eventName: $eventName2)
                    EventTextBoxView(eventName: $eventName3)
                    EventTextBoxView(eventName: $eventName4)
                    EventTextBoxView(eventName: $eventName5)
                }
                
                Button() {
                    
                } label: {
                    Text("Urgent Events")
                }
                .frame(width: 262, height: 80)
                .font(.modeSeven24)
                .background(Color.digiGray)
                .cornerRadius(36)
                .foregroundColor(.digiRed)
                .padding(.vertical, 24)
                
                NavigationLink(destination: CalendarView()) {
                    Text("Calendar\nButton\nImage")
                        .frame(width: 112, height: 112)
                        .background(Color.digiGray)
                        .cornerRadius(15)
                        .foregroundColor(.digiGreen)
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action : {
                    self.mode.wrappedValue.dismiss()
                }){
                    Text("<")
                        .font(.modeSeven36)
                        .foregroundColor(.digiGreen)
                        .padding(.leading, 15)
                })
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Calendar")
                            .font(.bitWise36)
                            .foregroundColor(.digiGreen)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
        }
    }
}

struct CalendarEventView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarEventView()
    }
}
