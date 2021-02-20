//
//  Opening.swift
//  StudyBuddy
//
//  Created by Raymond Kuan on 2/19/21.
//

import SwiftUI

struct Opening: View {
    @State private var showMainView = false
    @State private var angle: Double = 360
    @State private var opacity: Double = 1
    @State private var scale: CGFloat = 1
    var body: some View {
        Group{
            if showMainView{
                ContentView()
            } else {
                ZStack{
                    Color("background")
                        .edgesIgnoringSafeArea(.all)
                    Image("applogo")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .rotation3DEffect(
                            .degrees(angle),
                            axis:(x:0.0, y:1.0, z:0.0))
        }
                .opacity(opacity)
                .scaleEffect(scale)
    }
}
        .onAppear{
            withAnimation(.linear(duration: 3)) {
                angle = 0
                scale = 2
                opacity = 1
            }
            withAnimation(Animation.linear.delay(1.75)){
                showMainView = true
            }
        }
    }
}

struct Opening_Previews: PreviewProvider {
    static var previews: some View {
        Opening()
    }
}
