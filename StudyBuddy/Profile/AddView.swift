//
//  AddView.swift
//  StudyBuddy
//
//  Created by Raymond Kuan on 2/20/21.
//

import SwiftUI

struct AddView: View{
    @Binding var push: String
    var body: some View{
        ZStack{
            Button(action: {
                withAnimation(.easeOut(duration: 0.3)){
                    self.push = "Profile"
                }
                    
                }) {
                    Image(systemName: "chevron.left").font(.title)
                        .position(x: 30, y: 90)
                        .foregroundColor(Color("darkpink"))
                }
            Text("Add New Personal Goal")
                .font(.custom("Avenir Next", size: 25))
                .fontWeight(.bold)
                .foregroundColor(Color("darkpink"))
                .position(x: 220, y: 90)
                
                
        }
    }
}
