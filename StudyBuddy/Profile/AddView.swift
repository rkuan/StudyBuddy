//
//  AddView.swift
//  StudyBuddy
//
//  Created by Raymond Kuan on 2/20/21.
//

import SwiftUI
import Firebase
import FirebaseDatabase

struct AddView: View{
    @Binding var push: String
    @State var goal = ""
    
    let user = Auth.auth().currentUser
    
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
            
            Spacer()
            
            Text("Add New Personal Goal")
                .font(.custom("AvenirNextCondensed-DemiBold", size: 25))
                .fontWeight(.bold)
                .foregroundColor(Color("darkpinktext"))
                .position(x: 180, y: 90)
            
            RoundedRectangle(cornerRadius: 25, style:.continuous)
                .fill(Color("darkpink"))
                .frame(width: 375, height: 600)
                .offset(y: 30)
            
            RoundedRectangle(cornerRadius: 25, style:.continuous)
                .fill(Color("white"))
                .frame(width: 320, height: 80)
                .offset(y: -190)
                
            
            TextField("Enter Goal...", text: self.$goal)
                .frame(width: 200, height: 600)
                .position(x: 170, y: 210)
                
        Spacer()
            
            VStack{
            Button(action: {
                withAnimation(.easeOut(duration: 0.3)){
                    var x = add_goal(goal: self.goal)
                    self.push = "Profile"
                }
                    
                }) {
                ZStack{
                RoundedRectangle(cornerRadius: 25, style:.continuous)
                    .fill(Color("lightpink"))
                    .frame(width: 180, height: 50)
                   // .position(x: 200, y: 500)
                
                    Text("Save Goal")
                        .font(.custom("Avenir Next", size: 25))
                        .foregroundColor(.black)
                        .fontWeight(.bold)

                }
                .padding(.bottom, 30)
                .padding(.leading, 150)
            }
               
            
            }
            .padding(.top, 600)
            
            
                
                
        }
    }
    
    func add_goal(goal: String) -> Int{

        let rootref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        
        var newgoal: [String: Any] = ["Goal":goal, "Time taken":0]
        var goals = rootref.child("users/\(userID)/personal goals").childByAutoId()
        let key = goals.key
        
        
        
        
        goals.setValue(newgoal)
        return 0
    }
}
