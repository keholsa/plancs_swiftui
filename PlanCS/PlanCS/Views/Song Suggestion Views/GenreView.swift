//
//  MajorView.swift
//  cs_content_views
//
//  Created by user234326 on 4/21/23.
//

import SwiftUI


struct GenreView: View {
    
    let genreNameArr = ["Classical", "Metal", "Country", "Rap", "Oldies", "EDM", "Pop", "Lo-Fi"]
    let genreImageArr = ["classical", "metal", "country", "rap", "oldies", "edm", "pop", "lofi"]
    
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
                    ForEach(0..<4) { rowIndex in
                        HStack(alignment: .center) {
                            ForEach(0..<2){ colIndex in
                                VStack(alignment: .center){
                                    
                                    Image(genreImageArr[rowIndex * 2 + colIndex])
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 135, height: 75)
                                        .padding(7)
                                    Text(genreNameArr[rowIndex * 2 + colIndex])
                                    
                                    //change font to mode seven
                                        .font(.system(size:24))
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .frame(width: 135)
                                }
                                .background(Color.gray)
                                .frame(width: 170, height: 200)
                                .cornerRadius(120)
                            }
                        }
                        .padding(.bottom, -65)
                        
                    }
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
        }

    }
    
}
    

struct GenreView_Previews: PreviewProvider {
    static var previews: some View {
        GenreView()
    }
}
