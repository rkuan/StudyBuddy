//
//  Profile.swift
//  StudyBuddy
//
//  Created by Raymond Kuan on 2/19/21.
//

import SwiftUI

struct Profile: View {
    var body: some View {
       Home()
        }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}

struct Home : View {
    var body: some View {
        
        VStack{
            ZStack {
                Color("background")
                    .edgesIgnoringSafeArea(.all)
                HStack{
                    Button(action: {}, label: {
                        
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.all)
                        
                    })
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        
                        Image(systemName: "message.fill")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.all)
                
                    })
                }
                
                Text("My Profile")
                    .font(.custom("Avinier Next", size: 34))
                    .foregroundColor(.red)
            }
            .padding(.top, 25)
            
            
            ZStack{
                
                RoundedRectangle(cornerRadius: 25, style:.continuous)
                    .fill(Color("darkpink"))
                    .frame(width: 375, height: 220)
                RoundedRectangle(cornerRadius: 25, style:.continuous)
                    .offset(x:-50 , y: 40)
                    .fill(Color.white)
                    .frame(width: 200, height: 200)
                Text("Raymond K.")
                    .offset(x:-70 , y: -90)
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.black)
                Image("otter")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200.0,height:200)
                    .offset(x:90 , y: 20)
                
                    
            }
            .padding(.bottom, 10)
       
            ZStack{
                RoundedRectangle(cornerRadius: 25, style:.continuous)
                    .fill(Color.white)
                    .frame(width: 375, height: 160)
            }
            .padding(.bottom, 20)
           
            ZStack{
                RoundedRectangle(cornerRadius: 25, style:.continuous)
                    .fill(Color.orange)
                    .frame(width: 375, height: 220)
            }
            .padding(.bottom, 80)
            
}
        .background(Color("background"))
    }
    
}
