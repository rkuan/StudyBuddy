//
//  Setting.swift
//  StudyBuddy
//
//  Created by Raymond Kuan on 2/20/21.
//

import SwiftUI


struct Setting: View{
    @Binding var push: String
    var body: some View{
        VStack(spacing: 15){
            ZStack{
                HStack{
                    Image("").resizable().frame(width: 250, height: 150)
                    Spacer()
                }
                
                HStack{
                    VStack(alignment: .leading, spacing: 45, content: {
                           
                        Button(action: {
                            withAnimation(.easeOut(duration: 0.3)){
                                self.push = "Profile"
                            }
                                
                            }) {
                                Image(systemName: "chevron.left").font(.title)
                            }
                        .offset(x: 0, y: 20)
                        
                        Text("Settings")
                            .font(.title)
                    }).foregroundColor(Color.black.opacity(0.5))
                    .offset(x: 20, y: 20)
                         
                    Spacer()
                           
                }.padding()
                .padding(.top, 10)
                
                VStack{
                    Image("").overlay(Text("K").foregroundColor(.white).font(.title))
                    
                    Spacer()
                }.padding(.top, 30)
                
            }.frame(height:175)
            
            VStack(spacing: 15){
                btnView(image: "user", name : "Manage Account")
                btnView(image: "bell", name : "Notifications")
                btnView(image: "shield", name : "Security")
                btnView(image: "tasks 2", name : "Your Activity")
                btnView(image: "question", name : "Help")
                btnView(image: "information", name : "About")
                
            }.padding()
            Spacer()
        }
    }
}

struct btnView: View{
    var image = ""
    var name = ""
    
    var body: some View{
        Button(action: {
            
        }) {
            HStack{
                Image(image).renderingMode(.original).resizable().frame(width: 40, height: 40)
                Text(name)
                Spacer(minLength: 15)
                Image(systemName: "chervron.right")
            }.padding()
            .foregroundColor(Color.black.opacity(0.5))
        }
    }
}
