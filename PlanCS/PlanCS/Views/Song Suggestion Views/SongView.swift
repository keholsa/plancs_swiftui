//
//  SongView.swift
//  cs_content_views
//
//  Created by user234326 on 4/22/23.
//

import SwiftUI
import Foundation



struct SongView: View {
    
    

    //demo line
    //let test = country_data.country_artist_names

    // random index function generator for song/artist selection
    var randomIndex: [Int]{
        
        // initializing index
        var index = Set<Int>()
        
        // counting index to 6
        while index.count < 6 {
            
            // selecting indexes based off incoming array size and picking a new index
            //TODO: change test_popArtistName to an incoming array depedent on selection
            index.insert(country_data.country_artist_names.indices.randomElement()!)
                
        }
        
        // return array of random index
        return Array(index)
    }
    
    var randomSingleIndex = Int.random(in: 0..<country_data.country_artist_names.count)
    
    
    @Environment(\.presentationMode) var presentationMode

    @State var optionVal: String


    var body: some View {
    
        
        NavigationView{
            VStack{
                
                Text("Music\nSuggestion")
                //change to modeseven
                    .font(.modeSeven36)
                //change to digigreen
                    .foregroundColor(.digiGreen)
                    .multilineTextAlignment(.center)
                
                VStack{
                    Text("Song of the Day")
                        .foregroundColor(.white)
                        .font(.modeSeven18)
                    
                    HStack{
                        Image("cd")
                        
                        
                        VStack{
                            
                            switch optionVal {
                            case "country":
                                AsyncImage(url: URL(string: country_data.country_track_images[randomSingleIndex]), scale: 8)
                                Text(country_data.country_track_names[randomSingleIndex])
                                    .foregroundColor(.white)
                                    .font(.modeSeven16)
                            case "edm":
                                AsyncImage(url: URL(string: edm_data.edm_track_images[randomSingleIndex]), scale: 8)
                                Text(edm_data.edm_track_names[randomSingleIndex])
                                    .foregroundColor(.white)
                                    .font(.modeSeven16)

                            case "lofi":
                                AsyncImage(url: URL(string: lofi_data.lofi_track_images[randomSingleIndex]), scale: 8)
                                Text(lofi_data.lofi_track_names[randomSingleIndex])
                                    .foregroundColor(.white)
                                    .font(.modeSeven16)

                            case "classical":
                                AsyncImage(url: URL(string: classical_data.classical_track_images[randomSingleIndex]), scale: 8)
                                Text(classical_data.classical_track_names[randomSingleIndex])
                                    .foregroundColor(.white)
                                    .font(.modeSeven16)

                            case "metal":
                                AsyncImage(url: URL(string: metal_data.metal_track_images[randomSingleIndex]), scale: 8)
                                Text(metal_data.metal_track_names[randomSingleIndex])
                                    .foregroundColor(.white)
                                    .font(.modeSeven16)

                            case "oldies":
                                AsyncImage(url: URL(string: oldies_data.oldies_track_images[randomSingleIndex]), scale: 8)
                                Text(oldies_data.oldies_track_names[randomSingleIndex])
                                    .foregroundColor(.white)
                                    .font(.modeSeven16)

                            case "pop":
                                AsyncImage(url: URL(string: pop_data.pop_track_images[randomSingleIndex]), scale: 8)
                                Text(pop_data.pop_track_names[randomSingleIndex])
                                    .foregroundColor(.white)
                                    .font(.modeSeven16)

                            case "rap":
                                AsyncImage(url: URL(string: rap_data.rap_track_images[randomSingleIndex]), scale: 8)
                                Text(rap_data.rap_track_names[randomSingleIndex])
                                    .foregroundColor(.white)
                                    .font(.modeSeven16)
                                
                            case "computer_engineering":
                                AsyncImage(url: URL(string: rap_data.rap_track_images[randomSingleIndex]), scale: 8)
                                Text(rap_data.rap_track_names[randomSingleIndex])
                                    .foregroundColor(.white)
                                    .font(.modeSeven16)
                            case "mechanical_engineering":
                                AsyncImage(url: URL(string: rap_data.rap_track_images[randomSingleIndex]), scale: 8)
                                Text(rap_data.rap_track_names[randomSingleIndex])
                                    .foregroundColor(.white)
                                    .font(.modeSeven16)
                            case "computer_science":
                                AsyncImage(url: URL(string: rap_data.rap_track_images[randomSingleIndex]), scale: 8)
                                Text(rap_data.rap_track_names[randomSingleIndex])
                                    .foregroundColor(.white)
                                    .font(.modeSeven16)
                            case "electircal_engineering":
                                AsyncImage(url: URL(string: rap_data.rap_track_images[randomSingleIndex]), scale: 8)
                                Text(rap_data.rap_track_names[randomSingleIndex])
                                    .foregroundColor(.white)
                                    .font(.modeSeven16)
                            case "math":
                                AsyncImage(url: URL(string: rap_data.rap_track_images[randomSingleIndex]), scale: 8)
                                Text(rap_data.rap_track_names[randomSingleIndex])
                                    .foregroundColor(.white)
                                    .font(.modeSeven16)
                            case "biology":
                                AsyncImage(url: URL(string: rap_data.rap_track_images[randomSingleIndex]), scale: 8)
                                Text(rap_data.rap_track_names[randomSingleIndex])
                                    .foregroundColor(.white)
                                    .font(.modeSeven16)

                            default:
                                Text("Error")
 
                            }
                            
                        }
                        
                        // add image of genre from previous selection here:
                        Image(optionVal)
                        
                    }
                    .frame(width:350, height: 100)
                }
                .background(Color(UIColor(hex: "#202020")!))
                .cornerRadius(10)
                //prob change with other elements
                .padding(.bottom, 100)
                .padding(.top, 50)
                VStack{
                    Text("Popular Artists:")
                        .foregroundColor(.white)
                        .font(.modeSeven18)
                    ScrollView(.horizontal, showsIndicators: true){
                        HStack{
                            ForEach(randomIndex, id: \.self){ index in
                                VStack{
                                        switch optionVal {
                                        case "country":
                                            AsyncImage(url: URL(string: country_data.country_artist_images[index]), scale: 5)
                                            Text(country_data.country_artist_names[index])
                                                .foregroundColor(.white)
                                                .font(.modeSeven16)
                                        case "edm":
                                            AsyncImage(url: URL(string: edm_data.edm_artist_images[index]), scale: 5)
                                            Text(edm_data.edm_artist_names[index])
                                                .foregroundColor(.white)
                                                .font(.modeSeven16)
                        
                                        case "lofi":
                                            AsyncImage(url: URL(string: lofi_data.lofi_artist_images[index]), scale: 5)
                                            Text(lofi_data.lofi_artist_names[index])
                                                .foregroundColor(.white)
                                                .font(.modeSeven16)

                                        case "classical":
                                            AsyncImage(url: URL(string: classical_data.classical_artist_images[index]), scale: 5)
                                            Text(classical_data.classical_artist_names[index])
                                                .foregroundColor(.white)
                                                .font(.modeSeven16)

                                        case "metal":
                                            AsyncImage(url: URL(string: metal_data.metal_artist_images[index]), scale: 5)
                                            Text(metal_data.metal_artist_names[index])
                                                .foregroundColor(.white)
                                                .font(.modeSeven16)

                                        case "oldies":
                                            AsyncImage(url: URL(string: oldies_data.oldies_artist_images[index]), scale: 5)
                                            Text(oldies_data.oldies_artist_names[index])
                                                .foregroundColor(.white)
                                                .font(.modeSeven16)

                                        case "pop":
                                            AsyncImage(url: URL(string: pop_data.pop_artist_images[index]), scale: 5)
                                            Text(pop_data.pop_artist_names[index])
                                                .foregroundColor(.white)
                                                .font(.modeSeven16)

                                        case "rap":
                                            AsyncImage(url: URL(string: rap_data.rap_artist_images[index]), scale: 5)
                                            Text(rap_data.rap_artist_names[index])
                                                .foregroundColor(.white)
                                                .font(.modeSeven16)
                            
                                        default:
                                            Text("Error")
                                        }
                                    
                                    
                                    
                       
                                }
                                .frame(width: 150, height: 150)
                                .background(Color(UIColor(hex: "#202020")!))
                                .cornerRadius(5)
                                
                            }
                        }
                    }
                }
                .padding(.top, -50)
                
                VStack{
                    Text("Trending Albums:")
                        .foregroundColor(.white)
                        .font(.modeSeven18)
                    
                    ScrollView(.horizontal, showsIndicators: true){
                        HStack{
                            ForEach(randomIndex, id: \.self){ index in
                                VStack{
                                    switch optionVal {
                                    case "country":
                                        AsyncImage(url: URL(string: country_data.country_track_images[index]), scale: 5)
                                        Text(country_data.country_track_names[index])
                                            .foregroundColor(.white)
                                            .font(.modeSeven16)
                                    case "edm":
                                        AsyncImage(url: URL(string: edm_data.edm_track_images[index]), scale: 5)
                                        Text(edm_data.edm_track_names[index])
                                            .foregroundColor(.white)
                                            .font(.modeSeven16)
                    
                                    case "lofi":
                                        AsyncImage(url: URL(string: lofi_data.lofi_track_images[index]), scale: 5)
                                        Text(lofi_data.lofi_track_names[index])
                                            .foregroundColor(.white)
                                            .font(.modeSeven16)

                                    case "classical":
                                        AsyncImage(url: URL(string: classical_data.classical_track_images[index]), scale: 5)
                                        Text(classical_data.classical_track_names[index])
                                            .foregroundColor(.white)
                                            .font(.modeSeven16)

                                    case "metal":
                                        AsyncImage(url: URL(string: metal_data.metal_track_images[index]), scale: 5)
                                        Text(metal_data.metal_track_names[index])
                                            .foregroundColor(.white)
                                            .font(.modeSeven16)

                                    case "oldies":
                                        AsyncImage(url: URL(string: oldies_data.oldies_track_images[index]), scale: 5)
                                        Text(oldies_data.oldies_track_names[index])
                                            .foregroundColor(.white)
                                            .font(.modeSeven16)

                                    case "pop":
                                        AsyncImage(url: URL(string: pop_data.pop_track_images[index]), scale: 5)
                                        Text(pop_data.pop_track_names[index])
                                            .foregroundColor(.white)
                                            .font(.modeSeven16)

                                    case "rap":
                                        AsyncImage(url: URL(string: rap_data.rap_track_images[index]), scale: 5)
                                        Text(rap_data.rap_track_names[index])
                                            .foregroundColor(.white)
                                            .font(.modeSeven16)
                        
                                    default:
                                        Text("Error")
                                    }
                                }
                                .frame(width: 150, height: 150)
                                .background(Color(UIColor(hex: "#202020")!))
                                .cornerRadius(5)
                                
                            }
                        }
                    }
                    
                    
                }
                .padding(.top, 10)
                
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


extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        let length = hexSanitized.count

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
            return nil
        }

        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0

        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0

        } else {
            return nil
        }

        self.init(red: r, green: g, blue: b, alpha: a)
    }
}
struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        SongView(optionVal: "country")
    }
}
