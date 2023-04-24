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
                .font(.modeSeven36)
            //change to digigreen
                .foregroundColor(.digiGreen)
                .multilineTextAlignment(.center)
                .padding(.bottom,60)
        
            //obj
            Text("Search for a suggestion by:")
                
            //change to modeseven
                .font(.modeSeven20)
            //change to digigreen
                .foregroundColor(.digiGreen)
                .padding(.bottom,50)
            
                
            
                VStack{
                    NavigationLink(destination: GenreView()){
                        VStack{
                            Image("genre_header")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 100)
                            
                            Text("Genre")
                            //change to modeseven
                                .font(.modeSeven28)
                            //change to digigreen
                                .foregroundColor(.white)
                        }
                        
                        //change to D9D9D9
                        .background(Color(UIColor(hex: "#202020")!))                    }
                    .cornerRadius(10)
                    
                    
                    NavigationLink(destination: MajorView()){
                        VStack{
                            Image("major_header")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 100)
                            
                            Text("Major")
                            //change to modeseven
                                .font(.modeSeven28)
                            //change to digigreen
                                .foregroundColor(.white)
                            
                            
                        }
                        
    
                        
                        //change to D9D9D9
                        .background(Color(UIColor(hex: "#202020")!))                        .cornerRadius(10)
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

