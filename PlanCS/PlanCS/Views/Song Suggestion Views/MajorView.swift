//
//  MajorView.swift
//  cs_content_views
//
//  Created by user234326 on 4/21/23.
//

import SwiftUI


struct MajorView: View {
    
    let majorNameArr = ["Computer\nScience", "Electrical\nEngineering", "Computer\nEngineering", "Mechanical\nEngineering", "Math &\nPhysics", "Biology &\n Chemistry"]
    let majorImageArr = ["computer_science", "electrical_engineering", "computer_engineering", "mechanical_engineering", "math", "biology"]
    
    var body: some View {
        
        NavigationView{
        VStack{
            
            Text("Music\nSuggestion")
            //change to modeseven
                .font(.title)
            //change to digigreen
                .foregroundColor(.green)
                .multilineTextAlignment(.center)
            
            
            
            //TODO: Fix position on import
            Text("Search for a suggestion by:")
            //change to modeseven
                .font(.headline)
            //change to digigreen
                .foregroundColor(.green)
                
            
                VStack {
                    Spacer()
                    ForEach(0..<3) { rowIndex in
                        HStack(alignment: .center) {
                            ForEach(0..<2){ colIndex in
                                VStack(alignment: .center){
                                    NavigationLink(destination: SongView(optionVal: majorImageArr[rowIndex * 2 + colIndex])){
                                        Image(majorImageArr[rowIndex * 2 + colIndex])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 135, height: 75)
                                            .padding(7)
                                        Text(majorNameArr[rowIndex * 2 + colIndex])
                                        
                                        //change font to mode seven
                                            .font(.system(size:24))
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.center)
                                            .frame(width: 135)
                                    }
                                }
                                .background(Color.gray)
                                .frame(width: 180, height: 220)
                                .cornerRadius(120)
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
        

    }
    
    
}
    

struct MajorView_Previews: PreviewProvider {
    static var previews: some View {
        MajorView()
    }
}
