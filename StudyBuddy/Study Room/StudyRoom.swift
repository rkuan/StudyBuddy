//
//  StudyRoom.swift
//  StudyBuddy
//
//  Created by Raymond Kuan on 2/19/21.
//

import SwiftUI

struct Study: View {
    @Binding var push: String
    var body: some View {
        
        VStack{
            // vertical stack
            Text("Create a Room")
                .font(.custom("AvenirNextCondensed-DemiBold", size: 45))
                .foregroundColor(Color("darkpinktext"))
                .fontWeight(.bold)
                .padding(.top, 75)
                // padding --> .padding(.all, 20)
            
            Text("select a study mode:")
                .font(.custom("AvenirNextCondensed-Italic", size: 25))
                .foregroundColor(.black)
                .position(x: 207, y: 70)
            VStack{
            ZStack{
            Button(action:{
                withAnimation(.easeOut(duration: 0.3)) {
                    self.push = "Solo"
                                }
            },
                label: {
                    ZStack{
                RoundedRectangle(cornerRadius: 15, style:.continuous)
                            .frame(width: 350, height: 100)
                            .foregroundColor(Color("lightpink"))
                            .padding(.bottom, 50)
                        Text("Solo Study")
                            .font(.custom("AvenirNextCondensed-DemiBoldItalic", size: 28))
                            .foregroundColor(Color("darkpink"))
                            .padding(.bottom, 50)
                            .offset(x: 2, y: 2)
                        Text("Solo Study")
                            .font(.custom("AvenirNextCondensed-DemiBoldItalic", size: 28))
                            .foregroundColor(.white)
                            .padding(.bottom, 50)
                    
                    }
                }
            )
               
            }
            
            ZStack{
            Button(action:{
                withAnimation(.easeOut(duration: 0.3)) {
                    self.push = "Buddy"
                                }
            },
                label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15, style:.continuous)
                                    .frame(width: 350, height: 100)
                                    .foregroundColor(Color("lightpink"))
                                    .padding(.bottom, 50)
                        Text("Study Buddy")
                            .font(.custom("AvenirNextCondensed-DemiBoldItalic", size: 28))
                            .foregroundColor(Color("darkpink"))
                            .padding(.bottom, 50)
                            .offset(x: 2, y: 2)
                        Text("Study Buddy")
                            .font(.custom("AvenirNextCondensed-DemiBoldItalic", size: 28))
                            .foregroundColor(.white)
                            .padding(.bottom, 50)
                    }
                }
            )
                
            }
            
            ZStack{
            Button(action:{
                withAnimation(.easeOut(duration: 0.3)) {
                    self.push = "Class"
                                }
            },
                label: {
                    ZStack{
                RoundedRectangle(cornerRadius: 15, style:.continuous)
                            .frame(width: 350, height: 100)
                            .foregroundColor(Color("lightpink"))
                            .padding(.bottom, 50)
                        Text("Class Study")
                            .font(.custom("AvenirNextCondensed-DemiBoldItalic", size: 28))
                            .foregroundColor(Color("darkpink"))
                            .padding(.bottom, 50)
                            .offset(x: 2, y: 2)
                        Text("Class Study")
                            .font(.custom("AvenirNextCondensed-DemiBoldItalic", size: 28))
                            .foregroundColor(.white)
                            .padding(.bottom, 50)
                    }
                }
            )
                
            }
            }.offset(x: 0, y: -40)
            
        } .background(Color("background"))
        }
}

