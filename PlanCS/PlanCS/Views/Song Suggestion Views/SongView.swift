//
//  SongView.swift
//  cs_content_views
//
//  Created by user234326 on 4/22/23.
//

import SwiftUI
import Foundation

struct SongView: View {
    
    @State var optionVal: String
    var body: some View {
        VStack{
            Text("Music\nSuggestion")
            //change to modeseven
                .font(.title)
            //change to digigreen
                .foregroundColor(.green)
                .multilineTextAlignment(.center)
            
            VStack{
                Text("Song of the Day")
                    .foregroundColor(.white)
                HStack{
                    
                }
            }
            
            VStack{
                Text("Popular Artists:")
                    .foregroundColor(.white)
                ScrollView(.horizontal, showsIndicators: true){
                    HStack{
                        
                    }
                }
            }
            
            VStack{
                Text("Trending Albums:")
                    .foregroundColor(.white)
                ScrollView(.horizontal, showsIndicators: true){
                    HStack{

                        
                    }
                }
                
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        SongView(optionVal: "computer_engineering")
    }
}
