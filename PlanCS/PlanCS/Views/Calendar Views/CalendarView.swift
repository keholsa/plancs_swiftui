//
//  CalendarView.swift
//  PlanCS
//
//  Created by Cannon Towell on 4/19/23.
//

import SwiftUI

struct CalendarView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    @State var title = "Calendar"
    
    var daysOfTheWeek = ["Su","Mo","Tu","We","Th","Fr","Sa"]
        
    var body: some View {
        NavigationStack{
            VStack {

                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button() {
                        
                    } label: {
                        Text("<=")
                    }
                    .frame(width: 36, height: 36)
                    .font(.modeSeven24)
                    .foregroundColor(.digiGreen)
                    
                    Spacer()
                    
                    Text("Month")
                        .font(.modeSeven36)
                        .foregroundColor(.digiGreen)
                    
                    Spacer()
                    
                    Button() {
                        
                    } label: {
                        Text("=>")
                    }
                    .frame(width: 36, height: 36)
                    .font(.modeSeven24)
                    .foregroundColor(.digiGreen)
                    
                    Spacer()
                }
                .padding(.bottom, 20)
                
                Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                    GridRow {
                        ForEach(0..<7) { i in
                            ZStack(alignment: .center) {
                                Rectangle()
                                    .border(Color.white, width: 1)
                                
                                Text(daysOfTheWeek[i])
                                    .font(.modeSeven30)
                                    .foregroundColor(.digiGreen)
                                    .padding(.trailing, 5)
                            }
                        }
                    }
                    ForEach(0..<6) { i in
                        GridRow {
                            ForEach(0..<7) { j in
                                ZStack(alignment: .top) {
                                    Rectangle()
                                        .foregroundColor(.digiGray)
                                        .border(Color.white, width: 1)
                                    
                                    Text("Day #")
                                        .font(.modeSeven16)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                }
                .frame(width: 374, height: 500)
                
                NavigationLink(destination: CalendarView()) {
                    Text("Add Event")
                        .frame(width: 200, height: 56)
                        .font(.bitWise24)
                        .background(Color.digiGray)
                        .cornerRadius(36)
                        .foregroundColor(.digiGreen)
                        .padding(.vertical, 40)
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
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
