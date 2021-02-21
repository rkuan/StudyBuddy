//
//  Chat.swift
//  StudyBear
//
//  Created by Raymond Kuan on 2/21/21.
//

import SwiftUI

struct Chats : View {
    @Binding var push: String
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var selectedTab = "Chats"
    @Namespace var animation
    
    var body: some View{
        
        VStack(spacing: 0){
            
            VStack{
                
                ZStack{
                    
                    HStack{
                        
                        Button(action: {
                            withAnimation(.easeOut(duration: 0.3)){
                                self.push = "Profile"
                            }
                                
                            }) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 22))
                                .foregroundColor(Color("darkpinktext"))
                            }
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {}, label: {
                            
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 22))
                                .foregroundColor(Color("darkpinktext"))
                        })
                    }
                    
                    Text("BearChat")
                        .font(.custom("AvenirNextCondensed-DemiBold", size: 45))
                        .fontWeight(.bold)
                        .offset(y: 3)
                        .foregroundColor(Color("darkpinktext"))
                        .ignoresSafeArea()
                }
                .padding()
                .padding(.top,edges!.top)
                .foregroundColor(.white)
                
                
                HStack(spacing: 20){
                    
                    ForEach(tabs,id: \.self){title in
                        
                       // TabButton(selectedTab: $selectedTab, title: title, animation: animation)
                    }
                }
                
            }
            .padding(.bottom)
            .background(Color("top"))
            .clipShape(CustomCorner(corner: .bottomLeft, size: 65))
            
            ZStack{
                
                Color("top")
                
                Color("bg")
                    .clipShape(CustomCorner(corner: .topRight, size: 65))
                 
                ScrollView(.vertical, showsIndicators: false, content: {
                    
                    VStack(spacing: 20){
                        
                        HStack{
                            
                            Text("All Chats")
                                .font(.title2)
                                .fontWeight(.bold)
                                
                            
                            Spacer(minLength: 0)
                            
                            Button(action: {}, label: {
                                
                                Image(systemName: "slider.horizontal.3")
                                    .font(.system(size: 22))
                                    .foregroundColor(.primary)
                            })
                        }
                        .padding([.horizontal,.top])
                        
                        
                        ForEach(data,id: \.groupName){gData in
                            
                            // Group Name..
                            HStack{
                                
                                Text(gData.groupName)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                                Spacer(minLength: 0)
                            }
                            .padding(.horizontal)
                            
                            // Group Data....
                            
                            ForEach(gData.groupData){chatData in
                                
                                // Chat View...
                                
                                ChatView(chatData: chatData)
                            }
                        }
                    }
                    .padding(.vertical)
                    
                })
                //.clipShape(CustomCorner(corner: .topRight, size: 65))
                // its cutting off inside view may be its a bug....
            }
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        .ignoresSafeArea(.all, edges: .top)
    }
}

var tabs = ["Chats","Status","Calls"]

struct TabButton : View {
    
    @Binding var selectedTab : String
    var title : String
    var animation : Namespace.ID
    
    var body: some View{
        
        Button(action: {
            
            withAnimation{
                
                selectedTab = title
            }
            
        }, label: {
            
            Text(title)
                .foregroundColor(.white)
                .padding(.vertical,10)
                .padding(.horizontal)
                // Sliding Effect...
                .background(
                
                    ZStack{
                        
                        if selectedTab == title{
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("top"))
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }
                )
        })
    }
}

struct CustomCorner : Shape {
    
    var corner : UIRectCorner
    var size : CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: size, height: size))
        
        return Path(path.cgPath)
    }
}

struct ChatView : View {
    
    var chatData : Chat
    
    var body: some View{
        
        HStack(spacing: 10){
            
            Image(chatData.image)
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 8, content: {
                
                Text(chatData.name)
                    .fontWeight(.bold)
                    .lineLimit(1)
                
                Text(chatData.msg)
                    .font(.caption)
                    .lineLimit(1)
            })
            
            Spacer(minLength: 0)
            
            Text(chatData.time)
                .font(.system(size: 15))
                .fontWeight(.bold)
        }
        .padding(.horizontal)
    }
}

// Model And Sample Data....

struct Chat : Identifiable {
    
    var id = UUID().uuidString
    var name : String
    var image : String
    var msg : String
    var time : String
}

// were going to do custom grouping of views....

struct HomeData {
    
    var groupName : String
    var groupData : [Chat]
}

var FriendsChat : [Chat] = [

    Chat(name: "Kenny",image: "p0", msg: "Hey EveryOne !!!", time: ""),
    Chat(name: "Peter Kavinski",image: "p1", msg: "Woah I got a letter", time: ""),
    Chat(name: "Joey Albert",image: "p2", msg: "Study Buddy? ", time: ""),
    Chat(name: "Sarch Johnson",image: "p3", msg: "how r u?", time: ""),
    Chat(name: "Martin",image: "p4", msg: "i want to sleep", time: ""),
    Chat(name: "Sett",image: "p5", msg: "Lets play roblox", time: ""),
]

var GroupChat : [Chat] = [

    Chat(name: "Ms Scott's 2021 Fall Class",image: "p0", msg: "Hey EveryOne !!!", time: ""),
    Chat(name: "hackers",image: "p1", msg: "Next Video :))))", time: ""),
    Chat(name: "trojan",image: "p2", msg: "New File Importer/Exporter", time: ""),
]

var data = [

    // Group 1
    HomeData(groupName: "Friends", groupData: FriendsChat),
    // Group 2
    HomeData(groupName: "Group Message", groupData: GroupChat)
]
