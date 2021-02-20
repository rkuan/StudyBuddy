//
//  StudyRoom.swift
//  StudyBuddy
//
//  Created by Raymond Kuan on 2/19/21.
//

import SwiftUI

struct StudyRoom: View {
    var body: some View {
        Study()
    }
}

struct StudyRoom_Previews: PreviewProvider {
    static var previews: some View {
        StudyRoom()
    }
}


struct Study: View {
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
            
            ZStack{
            RoundedRectangle(cornerRadius: 15, style:.continuous)
                .frame(width: 350, height: 100)
                .foregroundColor(Color("lightpink"))
                .padding(.bottom, 20)
                .position(x: 207, y: -150)
                Text("Solo Study")
                    .font(.custom("AvenirNextCondensed-DemiBoldItalic", size: 28))
                    .foregroundColor(Color("darkpink"))
                    .position(x: 207, y: -155)
                    .offset(x: 2, y: 2)
                Text("Solo Study")
                    .font(.custom("AvenirNextCondensed-DemiBoldItalic", size: 28))
                    .foregroundColor(.white)
                    .position(x: 207, y: -155)
                
            ZStack{
            RoundedRectangle(cornerRadius: 15, style:.continuous)
                .frame(width: 350, height: 100)
                .foregroundColor(Color("lightpink"))
                .padding(.bottom, 20)
                .position(x: 207, y: 0)
                Text("Study Buddy")
                    .font(.custom("AvenirNextCondensed-DemiBoldItalic", size: 28))
                    .foregroundColor(Color("darkpink"))
                    .position(x: 207, y: -5)
                    .offset(x: 2, y: 2)
                Text("Study Buddy")
                    .font(.custom("AvenirNextCondensed-DemiBoldItalic", size: 28))
                    .foregroundColor(.white)
                    .position(x: 207, y: -5)
                
            ZStack{
            RoundedRectangle(cornerRadius: 15, style:.continuous)
                .frame(width: 350, height: 100)
                .foregroundColor(Color("lightpink"))
                .padding(.bottom, 20)
                .position(x: 207, y: 150)
                Text("Class Study")
                    .font(.custom("AvenirNextCondensed-DemiBoldItalic", size: 28))
                    .foregroundColor(Color("darkpink"))
                    .position(x: 207, y: 145)
                    .offset(x:2, y:2)
                Text("Class Study")
                    .font(.custom("AvenirNextCondensed-DemiBoldItalic", size: 28))
                    .foregroundColor(.white)
                    .position(x: 207, y: 145)
        }
        }
}
        } .background(Color("background"))
    }
}
