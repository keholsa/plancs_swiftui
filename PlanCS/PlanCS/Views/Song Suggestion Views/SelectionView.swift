//
//  ContentView.swift
//  cs_content_views
//
//  Created by user234326 on 4/20/23.
//

import SwiftUI


struct SelectionView: View {
    
    var body: some View {
        
        NavigationView{
        
        VStack {
            
            // title message
            
            Text("Music\nSuggestion")
            //change to modeseven
                .font(.title)
            //change to digigreen
                .foregroundColor(.green)
                .multilineTextAlignment(.center)
        
        
            //obj
            Text("Search for a suggestion by:")
                
            //change to modeseven
                .font(.headline)
            //change to digigreen
                .foregroundColor(.green)
            
                
            
                VStack{
                    NavigationLink(destination: GenreView()){
                        VStack{
                            Image("genre_header")
                            Text("Genre")
                            //change to modeseven
                                .font(.title)
                            //change to digigreen
                                .foregroundColor(.green)
                        }
                        
                        //change to D9D9D9
                        .background(.gray)
                    }
                    
                    
                    NavigationLink(destination: MajorView()){
                        VStack{
                            Image("major_header")
                            Text("Major")
                            //change to modeseven
                                .font(.title)
                            //change to digigreen
                                .foregroundColor(.green)
                        }
                        //change to D9D9D9
                        .background(.gray)
                    }
                }
            }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
                
            
            
            
        }
        

    }
        
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView()
    }
}

