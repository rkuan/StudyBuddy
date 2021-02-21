//
//  Solo.swift
//  StudyBuddy
//
//  Created by Kayla Kelsall on 2/20/21.
//

import Foundation
import SwiftUI

struct Solo: View{
    @Binding var push: String

    var body: some View{
        
          VStack{
            
            Text("Solo Study")
                .font(.custom("AvenirNextCondensed-DemiBold", size: 45))
                .foregroundColor(Color("darkpinktext"))
                .fontWeight(.bold)
                .padding(.top, 20)
              }
    
              ZStack{
                  
                  RoundedRectangle(cornerRadius: 25, style:.continuous)
                      .fill(Color("darkpink"))
                      .frame(width: 375, height: 420)
                    .padding(.bottom, 185)
                  RoundedRectangle(cornerRadius: 25, style:.continuous)
                      .offset(x:-10 , y: 30)
                      .fill(Color("lightpink"))
                      .frame(width: 300, height: 320)
                    .padding(.bottom, 205)
                  
    
                  Text("Kayla K.")
                      .font(.custom("AvenirNextCondensed-DemiBold", size: 38))
                      .foregroundColor(Color("white"))
                      .offset(x:-95 , y: -170)
                    .padding(.bottom, 185)
                
                ZStack{
                    Text("Goals:")
                        .font(.custom("AvenirNextCondensed-DemiBold", size: 34))
                        .fontWeight(.bold)
                        .foregroundColor(Color("black"))
                        .offset(x: -100, y: -100)
                        .padding(.bottom, 185)
                    
                }
            

                  
                  Image("bear")
                      .resizable()
                      .scaledToFit()
                      .frame(width: 250,height:250)
                    .offset(x: 70, y: 90)
                    .padding(.bottom, 190)
                  
                      
              }
              }
    }
