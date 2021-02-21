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
    @Binding var didrun: Bool
    @State var string_taskcompleted: String = ""
    @State var string_name: String = ""
    @State var personal_list : Set<String> = []
    
   
    
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
               
                
                var x = retrieve_personalgoal()
                Text("Personal")
                    .font(.custom("Avenir Next", size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color("white"))
                    .position(x: 270, y: 30)
                
                //
                VStack(spacing: 20){
                    var temp = array.variable
                    ForEach(temp, id: \.self) { goal in
                        academic_checklist(realname:goal)
                        
                        
                    }
                        
                }
                .padding(.leading, -175)
                .padding(.top, 30)
               
                
                Button(action:{
                    withAnimation(.easeOut(duration: 0.3)) {
                        self.push = "Addview"
                                    }
                },
                    label: {
                    
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color("white"))
                            
                    
                })
                .padding(.leading, 305)
                .padding(.top, -130)
                
                Button(action:{
                    withAnimation(.easeOut(duration: 0.3)) {
                        self.push = "Party"
                                    }
                },
                    label: {
                    
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color("white"))
                            
                    
                })
                .padding(.leading, -50)
                .padding(.top, -130)
                
                VStack(spacing: 20){
                    var temp = convert()
                    ForEach(temp, id: \.self) { goal in
                        checklist(name:goal)
                        
                        
                    }
                        
                }
                .padding(.leading, 175)
                .padding(.top, -80)
                }
            
                .padding(.bottom, 20)
            
            ZStack{
                RoundedRectangle(cornerRadius: 25, style:.continuous)
                    .fill(Color("darkpink"))
                    .frame(width: 375, height: 600)
                VStack{
                    upcoming()
                }
                .padding(.top, 10)
            
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
    
    func retrieve_personalgoal() -> Int{
        
        if self.didrun == true{
        let rootref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        var goals = rootref.child("users/\(userID)/personal goals")
        
        goals.observe(.childAdded, with: { snapshot in
            let target = snapshot.childSnapshot(forPath: "Goal").value as? String ?? "No Goal"
            self.personal_list.insert(target)
           
 
            })
            print(self.personal_list)
        return 0
        }
        else{
            return 0
    }
    }
        func retrieve_personalgoal(temp : Set<String>) -> Array<String>{
            var temp:Array<String> = []
            for goal in temp{
                temp.append(goal)
            }
            return temp
            
    
    }
    func convert() -> Array<String>{
        var temp:Array<String> = []
        for goal in self.personal_list{
            temp.append(goal)
        }
        return temp
        


}
}


struct checklist: View{
    var name = ""
    @State var toggle = false
    
    var body: some View{
        ZStack{
            
        ZStack{
            
        
        RoundedRectangle(cornerRadius: 25, style:.continuous)
            .fill(Color("lightpink"))
            .frame(width: 150, height: 40)
        Text(name)
            .font(.custom("Avenir Next", size: 15))
        }
        
        Button(action:{
            withAnimation(.easeOut(duration: 0.3)) {
                    self.toggle = true
                                           }
        },
            label: {
            
                Image(systemName: "circlebadge")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(Color("white"))
                    
                    
            
        })
        .offset(x: -50)
        
        }
    }
    func remove(arr:Array<String>, name:String) -> Array<String>{
        var temp:[String] = []
        for element in arr{
            if element != name{
                temp.append(element)
            }
        }
        return temp
        
    }
}

struct academic_checklist: View{
    @State var temp = array.variable
    @State var realname = ""
    @State var toggle = false
    
    
    var body: some View{
        ZStack{
            
        ZStack{
            
        
        RoundedRectangle(cornerRadius: 25, style:.continuous)
            .fill(Color("lightpink"))
            .frame(width: 150, height: 40)
        Text(realname)
            .font(.custom("Avenir Next", size: 15))
        }
        
            Button(action:{remove(name: realname)
            withAnimation(.easeOut(duration: 0.3)) {
                var currentcount = get_num()
                print(array.taskcompleted)
                array.taskcompleted += 1
                var x = set_num(newnum: array.taskcompleted)
                }
        },
            label: {
            
                if self.toggle == true{
                    Image(systemName: "circlebadge.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(Color("white"))
                }
                else{
                    Image(systemName: "circlebadge")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(Color("white"))
                    
                }
            
        })
        .offset(x: -50)
        
        }
    }
    func remove(name: String){
        
        if self.toggle == false{
            self.toggle = true}
        else if (self.toggle == true){
            self.toggle = false
        }
                                 
        print(array.variable)
        if self.toggle == true{
            print("True")
            var count = 0
            for element in array.variable{
                print(element)
                if (element == name){
                    array.variable.remove(at : count)
                    print(array.variable)
                    
                    
                }
                else{
                    count += 1
                }
            }
            
        
        }
        else if (self.toggle == false){
            self.toggle = true
        }
            }
    func get_num() -> String{
        var target:Int = 0
       
        let rootref = Database.database().reference()
        //let userID = Auth.auth().currentUser?.uid
        rootref.child("users/\(Auth.auth().currentUser?.uid)/tasks completed").observeSingleEvent(of: .value)
        {(snapshot) in
            let number = snapshot.value as! Int
            array.taskcompleted = (number)
        }
        return String(target)
    }
    
    func set_num(newnum: Int) -> Int{
        let rootref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        rootref.child("users/\(userID)/tasks completed").setValue(newnum)
            return 0
    }
    
    
       
        
    }
    


struct array{
    static var variable:Array = ["History Hw", "Math Quiz", "Rock Test", "Poem"]
    static var taskcompleted = 12
    

}


struct upcoming: View{
    @State var temp = ["History Hw", "Math Quiz", "Rock Test", "Poem"]
    @State var realname = ""
    @State var toggle = false
    
    
    var body: some View{
        VStack{
            Text("Upcoming Assignments")
                .font(.custom("Avenir Next", size: 25))
                .fontWeight(.bold)
                .foregroundColor(Color("white"))
                .offset(y: -10)
        ZStack{
        RoundedRectangle(cornerRadius: 25, style:.continuous)
            .fill(Color("lightpink"))
            .frame(width: 360, height: 100)
        
        Text("History Hw")
            .font(.custom("Avenir Next", size: 25))
            .fontWeight(.bold)
            .foregroundColor(Color("black"))
            .offset(x: -90)
           
        
        Text("2/24")
            .font(.custom("Avenir Next", size: 25))
            .fontWeight(.bold)
            .foregroundColor(Color("black"))
             .offset(x: 135)
          
        }
            ZStack{
            RoundedRectangle(cornerRadius: 25, style:.continuous)
                .fill(Color("lightpink"))
                .frame(width: 360, height: 100)
            
            Text("Math Quiz")
                .font(.custom("Avenir Next", size: 25))
                .fontWeight(.bold)
                .foregroundColor(Color("black"))
                .offset(x: -90)
               
            
            Text("2/26")
                .font(.custom("Avenir Next", size: 25))
                .fontWeight(.bold)
                .foregroundColor(Color("black"))
                 .offset(x: 135)
              
            }
            ZStack{
            RoundedRectangle(cornerRadius: 25, style:.continuous)
                .fill(Color("lightpink"))
                .frame(width: 360, height: 100)
            
            Text("Rock Quiz")
                .font(.custom("Avenir Next", size: 25))
                .fontWeight(.bold)
                .foregroundColor(Color("black"))
                .offset(x: -90)
               
            
            Text("2/28")
                .font(.custom("Avenir Next", size: 25))
                .fontWeight(.bold)
                .foregroundColor(Color("black"))
                 .offset(x: 135)
              
            }
            ZStack{
            RoundedRectangle(cornerRadius: 25, style:.continuous)
                .fill(Color("lightpink"))
                .frame(width: 360, height: 100)
            
            Text("Poem Quiz")
                .font(.custom("Avenir Next", size: 25))
                .fontWeight(.bold)
                .foregroundColor(Color("black"))
                .offset(x: -90)
               
            
            Text("2/28")
                .font(.custom("Avenir Next", size: 25))
                .fontWeight(.bold)
                .foregroundColor(Color("black"))
                 .offset(x: 135)
              
            }
        
        }
    }
}
