//
//  TabBar.swift
//  StudyBuddy
//
//  Created by Raymond Kuan on 2/19/21.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        Tab()
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}


var tabItems = ["Home","Search","Favourites"] //changes the name of the tab bar

struct Tab : View {
    
    @State var selected = "Home"
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    @State var centerX : CGFloat = 0
    
    @Environment(\.verticalSizeClass) var size
    
    var body: some View{
        
        VStack(spacing: 0){
            TabView(selection: $selected){
                
                ProfileControl()
                    .tag(tabItems[0])
                   
                    .ignoresSafeArea(.all, edges: .top)
                   
                
                StudyRoomControl()
                    .tag(tabItems[1])
                    .ignoresSafeArea(.all, edges: .top)
                
                Color.black
                    .tag(tabItems[2])
                    .ignoresSafeArea(.all, edges: .top)
                
            }
            .animation(.none)
 
            HStack(spacing: 0){
                
                ForEach(tabItems,id: \.self){value in
                    
                    GeometryReader{reader in
                        
                        TabBarButton(selected: $selected, value: value,centerX: $centerX,rect: reader.frame(in: .global))
                            .onAppear(perform: {
                                
                                if value == tabItems.first{
                                    centerX = reader.frame(in: .global).midX
                                }
                            })
                            // For Landscape Mode....
                            .onChange(of: size) { (_) in
                                print("hello")
                                if selected == value{
                                    centerX = reader.frame(in: .global).midX
                                }
                            }
                    }
                    .frame(width: 70, height: 50)
                    
                    if value != tabItems.last{Spacer(minLength: 0)}
                }
            }
            .padding(.horizontal,25)
            .padding(.top)
            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .background(Color("lightpink").clipShape(AnimatedShape(centerX: centerX))) //touch bar color
            .padding(.top,-15)
            .ignoresSafeArea(.all, edges: .horizontal)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct TabBarButton : View {
    
    @Binding var selected : String
    var value: String
    @Binding var centerX : CGFloat
    var rect : CGRect
    
    var body: some View{
        
        Button(action: {
            withAnimation(.spring()){
                selected = value
                centerX = rect.midX
            }
        }, label: {
            
            VStack{
                
                Image(value)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 26, height: 26)
                    .foregroundColor(selected == value ? Color("black") : .gray) //color of image in touch bar, color of the image not in touch bar
                
            }
            .padding(.top)
            .frame(width: 70, height: 50)
        })
    }
}


struct AnimatedShape: Shape {
    
    var centerX : CGFloat
    
    var animatableData: CGFloat{
        
        get{return centerX}
        set{centerX = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in
            path.move(to: CGPoint(x: 0, y: 15))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 15))
            path.move(to: CGPoint(x: centerX - 35, y: 15))
        }
    }
}
