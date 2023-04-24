//
//  SongView.swift
//  cs_content_views
//
//  Created by user234326 on 4/22/23.
//

import SwiftUI
import Foundation

struct SongView: View {
    
    
    // testing data for form
    let test_popArtistNameArr = ["Test Name1", "Test Name2", "Test Name3", "Test Name4", "Test Name5", "Test Name6", "Test Name7", "Test Name8"]
    let test_popArtistImgArr = ["classical", "metal", "country", "rap", "oldies", "edm", "pop", "lofi"]
    let test_popTrackNameArr = ["Test Name1", "Test Name2", "Test Name3", "Test Name4", "Test Name5", "Test Name6", "Test Name7", "Test Name8"]
    let test_popTrackImgArr = ["classical", "metal", "country", "rap", "oldies", "edm", "pop", "lofi"]
    

    // random index function generator for song/artist selection
    var randomIndex: [Int]{
        
        // initializing index
        var index = Set<Int>()
        
        // counting index to 6
        while index.count < 6 {
            
            // selecting indexes based off incoming array size and picking a new index
            //TODO: change test_popArtistName to an incoming array depedent on selection
            index.insert(test_popArtistNameArr.indices.randomElement()!)
                
        }
        
        // return array of random index
        return Array(index)
    }
    
    @State var optionVal: String
    var body: some View {
        

        
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
                        Image(test_popTrackImgArr[1])
    
                        Text(test_popTrackNameArr[1])
                            .foregroundColor(.white)
                            .font(.modeSeven18)
                            .lineLimit(nil)
                        
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
                                Image(test_popArtistImgArr[index])
                                
                                Text(test_popArtistNameArr[index])
                                    .foregroundColor(.white)
                                    .font(.modeSeven16)
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
                                Image(test_popArtistImgArr[index])
                                Text(test_popArtistNameArr[index])
                                    .foregroundColor(.white)
                                    .font(.modeSeven16)
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
        SongView(optionVal: "computer_engineering")
    }
}