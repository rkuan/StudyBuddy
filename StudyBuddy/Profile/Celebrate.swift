//
//  Celebrate.swift
//  StudyBuddy
//
//  Created by Raymond Kuan on 2/20/21.
//

import SwiftUI

struct Celebrate: View {
    @Binding var push: String
    var body: some View {
        Color("Background")
        VStack{
        Image("BEARS")
            .resizable()
            .scaledToFit()
            .frame(width: 460, height: 460)
            Text("Great Job Finishing")
                .font(.custom("AvenirNextCondensed-DemiBold", size: 25))
                .fontWeight(.bold)
                .foregroundColor(Color("darkpinktext"))
                .offset(y: -70)
               
            Text("Your Assignment!")
                .font(.custom("AvenirNextCondensed-DemiBold", size: 25))
                .fontWeight(.bold)
                .foregroundColor(Color("darkpinktext"))
                .offset(y: -70)
           
            
            Button(action: {
                withAnimation(.easeOut(duration: 0.3)){
                    self.push = "Profile"
                }
                    
                }) {
            
            
            ZStack{
        RoundedRectangle(cornerRadius: 25, style:.continuous)
                .fill(Color("lightpink"))
                .frame(width: 250, height: 50)
                .offset(y: 20)
        Text("Continue")
            .font(.custom("AvenirNextCondensed-DemiBold", size: 25))
            .fontWeight(.bold)
            .foregroundColor(Color("darkpinktext"))
            .offset(y: 20)
                
            }
            }

        
        }  .background(Color("background"))
    }
  
   
}

