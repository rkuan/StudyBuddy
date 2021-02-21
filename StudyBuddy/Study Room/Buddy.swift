//
//  Buddy.swift
//  StudyBuddy
//
//  Created by Kayla Kelsall on 2/20/21.
//

import Foundation
import SwiftUI

struct Buddy: View{
    @Binding var push: String
    var body: some View{
        
          VStack{
            
            Text("Solo Study")
                .font(.custom("AvenirNextCondensed-DemiBold", size: 45))
                .foregroundColor(Color("darkpinktext"))
                .fontWeight(.bold)
                .padding(.all, 30)
                .position(x: 207, y: 100)
              }
    
              ZStack{
                  
                  RoundedRectangle(cornerRadius: 25, style:.continuous)
                      .fill(Color("darkpink"))
                      .frame(width: 375, height: 250)
                    .padding(.bottom, 100)
                  RoundedRectangle(cornerRadius: 25, style:.continuous)
                      .offset(x:-10 , y: 30)
                      .fill(Color("lightpink"))
                      .frame(width: 300, height: 170)
                    .padding(.bottom, 120)
                  
    
                  Text("Kayla K.")
                      .font(.custom("AvenirNextCondensed-DemiBold", size: 38))
                      .foregroundColor(Color("white"))
                      .offset(x: -87, y: -170)
                    .padding(.bottom, 100)
                
                ZStack{
                    Text("Goals:")
                        .font(.custom("AvenirNextCondensed-DemiBold", size: 34))
                        .foregroundColor(Color("white"))
                        .offset(x: -100, y: -100)
                        .padding(.bottom, 100)
                    
                }
            
                  
                  Image("bear")
                      .resizable()
                      .scaledToFit()
                      .frame(width: 200,height:200)
                    .offset(x: 70, y: 90)
                    .padding(.bottom, 260)
                  
                ZStack{
                    RoundedRectangle(cornerRadius: 15, style:.continuous)
                        .fill(Color("lightpink"))
                        .frame(width: 350, height: 50)
                        .position(x: 207, y: 750)
                    
                    Text("Leave Session")
                        .font(.custom("AvenirNextCondensed-DemiBoldItalic", size: 20))
                        .foregroundColor(Color("white"))
                        .position(x: 207, y: 750)
                }
                      
              }
              }
    }
