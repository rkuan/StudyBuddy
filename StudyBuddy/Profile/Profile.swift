//
//  Profile.swift
//  StudyBuddy
//
//  Created by Raymond Kuan on 2/19/21.
//

import SwiftUI
import Firebase
import FirebaseDatabase



struct Profile : View {
    @Binding var push: String
    @State var string_taskcompleted: String = ""
    @State var string_name: String = ""
    
    let user = Auth.auth().currentUser

    var body: some View {
      
        
        VStack{
               
                
            ZStack {
              
                
                HStack{
                    Button(action:{
                        withAnimation(.easeOut(duration: 0.3)) {
                            self.push = "Setting"
                                        }
                    },
                        label: {
                        
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
                .background(Color("background"))
               
                
                Text("My Profile")
                    .font(.custom("AvenirNextCondensed-DemiBold", size: 45))
                    .fontWeight(.bold)
                    .offset(y: 3)
                    .foregroundColor(Color("darkpinktext"))
                    .ignoresSafeArea()
                
               
            }
            .padding(.top, 45)
            .background(Color("background")).ignoresSafeArea()
            
            
            ScrollView(.vertical, showsIndicators: false){
                
            ZStack{
                
                RoundedRectangle(cornerRadius: 25, style:.continuous)
                    .fill(Color("darkpink"))
                    .frame(width: 375, height: 280)
                RoundedRectangle(cornerRadius: 25, style:.continuous)
                    .offset(x:-20 , y: 25)
                    .fill(Color("lightpink"))
                    .frame(width: 300, height: 190)
                
                var name_display:String = name()
                Text(self.string_name)
                    .font(.custom("AvenirNextCondensed-DemiBold", size: 38))
                    .foregroundColor(Color("white"))
                    .offset(x:-60 , y: -100)
                Text("Miss Scott's 1st Grade Class")
                    .font(.custom("AvenirNextCondensed-Italic", size: 17))
                    .offset(x:-20 , y: -45)
               
                
                var num_display:String = task_completed()
                //let x = task_completed(newnum: 10)
                Text(self.string_taskcompleted)
                    .font(.custom("AvenirNextCondensed-DemiBold", size: 80))
                    .fontWeight(.bold)
                    .foregroundColor(Color("black"))
                    .position(x: 190, y: 165)
                
                Text("tasks completed")
                    .font(.custom("AvenirNextCondensed-Italic", size: 15))
                    .foregroundColor(Color("black"))
                    .position(x: 194, y: 210)
                
                Image("ribbon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height:100)
                    .position(x: 95, y: 175)
                Image("bear")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160,height:160)
                    .position(x: 310, y: 189)
                
                    
            }
            .padding(.bottom, 25)
            .padding(.top, 20)
            .background(Color("background")).ignoresSafeArea()
            
       
            ZStack{
                Text("Weekly Goals:")
                    .font(.custom("AvenirNextCondensed-DemiBold", size: 34))
                    .fontWeight(.bold)
                    .foregroundColor(Color("black"))
                    .offset(x: -80, y: -15)
                
                Text("February 15-21, 2021")
                    .font(.custom("AvenirNextCondensed-DemiBoldItalic", size: 20))
                    .foregroundColor(Color("darkpinktext"))
                    .offset(x: -95, y: 20)
                
            }
            .padding(.bottom, 10)
            ZStack{
                RoundedRectangle(cornerRadius: 25, style:.continuous)
                    .fill(Color("darkpink"))
                    .frame(width: 180, height: 290)
                    .position(x: 110, y: 150)
                RoundedRectangle(cornerRadius: 25, style:.continuous)
                    .fill(Color("darkpink"))
                    .frame(width: 180, height: 290)
                    .position(x: 300, y: 150)
                Text("Academic")
                    .font(.custom("Avenir Next", size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color("white"))
                    .position(x: 85, y: 30)
                Text("Personal")
                    .font(.custom("Avenir Next", size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color("white"))
                    .position(x: 270, y: 30)
                
                //
                
                Button(action:{
                    withAnimation(.easeOut(duration: 0.3)) {
                        self.push = "Addview"
                                    }
                },
                    label: {
                    
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color("white"))
                            .position(x: 360, y: 30)
                    
                })
            }
                .padding(.bottom, 20)
            
            ZStack{
                RoundedRectangle(cornerRadius: 25, style:.continuous)
                    .fill(Color("darkpink"))
                    .frame(width: 375, height: 300)
                Text("Upcoming Assignments")
                    .font(.custom("Avenir Next", size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(Color("white"))
                    .offset(y: -100)
                    
            
            .padding(.bottom, 35)
        }
           
}
            .background(Color("background")).ignoresSafeArea()
        }
           
        
    }
    
    func task_completed() -> String{
        var target:Int = 0
       
        let rootref = Database.database().reference()
        //let userID = Auth.auth().currentUser?.uid
        rootref.child("users/\(Auth.auth().currentUser?.uid)/tasks completed").observeSingleEvent(of: .value)
        {(snapshot) in
            let number = snapshot.value as! Int
            self.string_taskcompleted = String(number)
        }
        return String(target)
    }
    
    func name() -> String{
        var target:Int = 0
       
        let rootref = Database.database().reference()
        //let userID = Auth.auth().currentUser?.uid
        rootref.child("users/\(Auth.auth().currentUser?.uid)/name").observeSingleEvent(of: .value)
        {(snapshot) in
            let name = snapshot.value as! String
            self.string_name = (name)
        }
        return String(target)
    }
        
    
    func task_completed(newnum: Int) -> Int{
        let rootref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        rootref.child("users/\(userID)/tasks completed").setValue(newnum)
            return 0
    }
}

