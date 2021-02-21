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
    @State var start = false
    @State var to : CGFloat = 0
    @State var count = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var selection: String

    var body: some View{
        
        VStack{
          
            HStack{
             Text("Buddy Study")
                .font(.custom("AvenirNextCondensed-DemiBold", size: 45))
                .foregroundColor(Color("darkpinktext"))
                .fontWeight(.bold)
                .position(x: 207, y: 140)
            }
            .padding(.bottom, 20)
            
  
            ZStack{
                
                RoundedRectangle(cornerRadius: 25, style:.continuous)
                    .fill(Color("darkpink"))
                    .frame(width: 375, height: 210)
                  .padding(.bottom, 100)
                RoundedRectangle(cornerRadius: 25, style:.continuous)
                    .offset(x:-10 , y: 30)
                    .fill(Color("lightpink"))
                    .frame(width: 300, height: 160)
                  .padding(.bottom, 120)
                
  
                Text("Kayla K.")
                    .font(.custom("AvenirNextCondensed-DemiBold", size: 38))
                    .foregroundColor(Color("white"))
                    .offset(x: -60, y: -80)
                  .padding(.bottom, 100)
              
              .offset(x: -40, y: 0)
                
                Image("bear")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height:100)
                  .offset(x: 135, y: 55)
                  .padding(.bottom, 105)
                
            }
            .offset(x: 0, y: 180)
            
        ZStack{
            
            RoundedRectangle(cornerRadius: 25, style:.continuous)
                .fill(Color("darkpink"))
                .frame(width: 375, height: 210)
              .padding(.bottom, 100)
            RoundedRectangle(cornerRadius: 25, style:.continuous)
                .offset(x:-10 , y: 30)
                .fill(Color("lightpink"))
                .frame(width: 300, height: 160)
              .padding(.bottom, 120)
            

            Text("Peter (Friend)")
                .font(.custom("AvenirNextCondensed-DemiBold", size: 38))
                .foregroundColor(Color("white"))
                .offset(x: -10, y: -80)
              .padding(.bottom, 100)
        
          .offset(x: -50, y: 0)
            Image("bear")
                .resizable()
                .scaledToFit()
                .frame(width: 100,height:100)
              .offset(x: 135, y: 55)
              .padding(.bottom, 105)
        }
        .offset(x: 0, y: 100)
                
                
              ZStack{
                  Text("\(self.count)")
                      .font(.system(size: 70))
                      .fontWeight(.bold)
                      .foregroundColor(Color("darkpinktext"))
                  //timer count
                  Text("Break time at 15 Minutes!")
                      .font(.system(size: 20))
                      .fontWeight(.bold)
                      .foregroundColor(Color("darkpinktext"))
                      .offset(x: 0, y: 70)
              }
              .offset(x: 0, y: 200)
              
              HStack(spacing: 20){
                  
                  Button(action: {
                      
                      if self.count == 100{
                          
                          self.count = 0
                          withAnimation(.default){
                              
                              self.to = 0
                          }
                      }
                      self.start.toggle()
                      
                  }) {
                      
                      HStack(spacing: 15){
                          
                          Image(systemName: self.start ? "pause.fill" : "play.fill")
                              .foregroundColor(.white)
                          
                          Text(self.start ? "Pause" : "Start")
                              .foregroundColor(.white)
                      }
                      .padding(.vertical)
                      .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                      .background(Color("lightpink"))
                      .clipShape(Capsule())
                     
                  }
                  
                  Button(action: {
                      
                      withAnimation(.easeOut(duration: 0.3)){
                          self.push = "StudyRoom"
                      }
                      
                  }) {
                      
                      HStack(spacing: 15){
                          
                          Text(self.start ? "End Session" : "Leave Session")
                              .foregroundColor(Color("white"))
                          
                      }
                      .padding(.vertical)
                      .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                      .background(Color("lightpink"))
                      .clipShape(Capsule())
                  }
              }
              .offset(x: 0, y: -50)
              
              
              
            }
            .onReceive(self.time) { (_) in
                if self.start{
                    if self.count != 15{
                        self.count += 1
                        withAnimation(.default){
                            self.to = CGFloat(self.count) / 15
                        }
                    }
                    else{
                    
                        self.start.toggle()
                    }

                }
                
            }
  }
    }
