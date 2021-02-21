//
//  Class.swift
//  StudyBuddy
//
//  Created by Kayla Kelsall on 2/20/21.
//

import Foundation
import SwiftUI

struct Class: View{
    @Binding var push: String
    @State var start = false
    @State var to : CGFloat = 0
    @State var count = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var selection: String

    var body: some View{
        
        VStack{
          
          Text("Class Study")
              .font(.custom("AvenirNextCondensed-DemiBold", size: 45))
              .foregroundColor(Color("darkpinktext"))
              .fontWeight(.bold)
              .padding(.all, 30)
              .position(x: 207, y: 100)
            }
  
            ZStack{
                
                RoundedRectangle(cornerRadius: 25, style:.continuous)
                    .fill(Color("darkpink"))
                    .frame(width: 375, height: 420)
                  .padding(.bottom, 100)
                RoundedRectangle(cornerRadius: 25, style:.continuous)
                    .offset(x:-10 , y: 30)
                    .fill(Color("lightpink"))
                    .frame(width: 300, height: 320)
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
                      .padding(.bottom, 100)
                      .offset(x: -50, y: 0)
                  VStack{
                      HStack{
                      Button(action:{
                      withAnimation(.easeOut(duration: 0.3)) {
                          self.selection = "History"
                          }
                  },
                      label: {
                      
                          if self.selection == "History"{
                              Image(systemName: "circlebadge.fill")
                                  .resizable()
                                  .frame(width: 20, height: 20)
                                  .font(.system(size: 25, weight: .bold))
                                  .foregroundColor(Color("white"))
                          }
                          else{
                              Image(systemName: "circlebadge")
                              .resizable()
                              .frame(width: 20, height: 20)
                              .font(.system(size: 25, weight: .bold))
                              .foregroundColor(Color("white"))
                              
                          }
                      
                  })
                  
                      
                      Text("History HW")
                          .font(.custom("AvenirNextCondensed-DemiBold", size: 30))
                          .foregroundColor(Color("white"))
                        
                  }
                      HStack{
                      Button(action:{
                      withAnimation(.easeOut(duration: 0.3)) {
                          self.selection = "Math"
                          }
                  },
                      label: {
                      
                          if self.selection == "Math"{
                              Image(systemName: "circlebadge.fill")
                                  .resizable()
                                  .frame(width: 20, height: 20)
                                  .font(.system(size: 25, weight: .bold))
                                  .foregroundColor(Color("white"))
                          }
                          else{
                              Image(systemName: "circlebadge")
                              .resizable()
                              .frame(width: 20, height: 20)
                              .font(.system(size: 25, weight: .bold))
                              .foregroundColor(Color("white"))
                              
                          }
                      
                  })
                  
                      
                      Text("Math Quiz")
                          .font(.custom("AvenirNextCondensed-DemiBold", size: 30))
                          .foregroundColor(Color("white"))
                        
                  }
                      .offset(x: -6, y: 0)
                      HStack{
                      Button(action:{
                      withAnimation(.easeOut(duration: 0.3)) {
                          self.selection = "Rock"
                          }
                  },
                      label: {
                      
                          if self.selection == "Rock"{
                              Image(systemName: "circlebadge.fill")
                                  .resizable()
                                  .frame(width: 20, height: 20)
                                  .font(.system(size: 25, weight: .bold))
                                  .foregroundColor(Color("white"))
                          }
                          else{
                              Image(systemName: "circlebadge")
                              .resizable()
                              .frame(width: 20, height: 20)
                              .font(.system(size: 25, weight: .bold))
                              .foregroundColor(Color("white"))
                              
                          }
                      
                  })
                  
                      
                      Text("Rock Test")
                          .font(.custom("AvenirNextCondensed-DemiBold", size: 30))
                          .foregroundColor(Color("white"))
                        
                      }.offset(x: -12, y: 0)
                  }
                  .offset(x: 0, y: 80)
              }
              .offset(x: -50, y: -100)
          

                
                Image("bear")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200,height:200)
                  .offset(x: 100, y: 100)
                  .padding(.bottom, 105)
                
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
              .offset(x: 0, y: 330)
              
              
              
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
