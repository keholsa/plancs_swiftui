//
//  MajorView.swift
//  cs_content_views
//
//  Created by user234326 on 4/21/23.
//

import SwiftUI


struct MajorView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let majorNameArr = ["Computer\nScience", "Electrical\nEngineering", "Computer\nEngineering", "Mechanical\nEngineering", "Math &\nPhysics", "Biology &\n Chemistry"]
    let majorImageArr = ["computer_science", "electrical_engineering", "computer_engineering", "mechanical_engineering", "math", "biology"]
    
    var body: some View {
        
        NavigationView{
            VStack{
                
                Text("Music\nSuggestion")
                //change to modeseven
                    .font(.modeSeven36)
                //change to digigreen
                    .foregroundColor(.digiGreen)
                    .multilineTextAlignment(.center)
                
                
                
                //TODO: Fix position on import
                Text("Search for a suggestion by:")
                //change to modeseven
                    .font(.modeSeven20)
                //change to digigreen
                    .foregroundColor(.digiGreen)
                    .padding(.top, 10)
                    .padding(.bottom, -100)
                
                
                VStack {
                    Spacer()
                    ForEach(0..<3) { rowIndex in
                        HStack(alignment: .center) {
                            ForEach(0..<2){ colIndex in
                                VStack(alignment: .center){
                                    NavigationLink(destination: SongView(optionVal: majorImageArr[rowIndex * 2 + colIndex])){
                                        VStack{
                                            Image(majorImageArr[rowIndex * 2 + colIndex])
                                            
                                            Text(majorNameArr[rowIndex * 2 + colIndex])
                                            
                                            //change font to mode seven
                                                .font(.modeSeven24)
                                                .foregroundColor(.white)
                                        }
                                        .frame(width: 165, height:130)
                                        .background(Color(UIColor(hex: "#202020")!))                   .cornerRadius(10)
                                        .padding(.bottom, 50)
                                        
                                    }
                                    
                                    
                                }
                                
                            }
                        }
                        .padding(.bottom, -35)
                        
                    }
                    Spacer()
                }
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action:{
            presentationMode.wrappedValue.dismiss()
        }, label:{
            Text("<")
                .font(.modeSeven36)
                .foregroundColor(.digiGreen)
        })
        )
    }
}
    

struct MajorView_Previews: PreviewProvider {
    static var previews: some View {
        MajorView()
    }
}
