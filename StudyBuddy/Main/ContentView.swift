//
//  ContentView.swift
//  StudyBuddy
//
//  Created by Raymond Kuan on 2/19/21.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @AppStorage("log_Status") var status = false
    @StateObject var model = ModelData()
    
    var body: some View {

        ZStack{
            
            if status{
                
                TabBar()
            }
            else{
                
                LoginView(model: model)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LoginView : View {
    
    @ObservedObject var model : ModelData
    
    var body: some View{
        
        ZStack{
            
            VStack{
                
                Spacer(minLength: 0)
                
                ZStack{
                    
                    if UIScreen.main.bounds.height < 750{
                        
                        Image("logo")
                            .resizable()
                            .frame(width: 200, height: 200)
                    }
                    else{
                        Image("logo")
                            .resizable()
                            .frame(width: 200, height: 200)
                    }
                }
                VStack(spacing: 4){
                    
                    HStack(spacing: 0){
                        
                        Text("")
                            .font(.system(size: 35, weight: .heavy))
                            .foregroundColor(.white)
                        
                        Text("")
                            .font(.system(size: 35, weight: .heavy))
                            .foregroundColor(Color("white"))
                    }
                    
                    Text("Please login to continue")
                        .foregroundColor(Color("darkpinktext"))
                        .fontWeight(.heavy)
                }
                .padding(.top)
                
                VStack(spacing: 20){
                    
                    CustomTextField(image: "person", placeHolder:("Email"), txt: $model.email)
                       
                    
                       
                    
                    CustomTextField(image: "lock", placeHolder: "Password", txt: $model.password)
                }
                .padding(.top)
               
                
                Button(action: model.login) {
                    
                    Text("LOGIN")
                        .fontWeight(.bold)
                        .foregroundColor(Color("black"))
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color("lightpink"))
                        .clipShape(Capsule())
                }
                .padding(.top,22)
                
                HStack(spacing: 12){
                    
                    Text("Don't have an account?")
                        .foregroundColor(Color("darkpinktext"))
                    
                    Button(action: {model.isSignUp.toggle()}) {
                        
                        Text("Sign Up Now")
                            .fontWeight(.bold)
                            .foregroundColor(Color("darkpinktext"))
                    }
                }
                .padding(.top,25)
                
                Spacer(minLength: 0)
                
                Button(action: model.resetPassword) {
                    
                    Text("Forget Password?")
                        .fontWeight(.bold)
                        .foregroundColor(Color("darkpinktext"))
                }
                .padding(.vertical,22)

            }
            
            if model.isLoading{
                
                LoadingView()
            }
        }
        .background(Color("background").ignoresSafeArea(.all, edges: .all))
        .fullScreenCover(isPresented: $model.isSignUp) {
            
            SignUpView(model: model)
        }
        .alert(isPresented: $model.alert, content: {
            
            Alert(title: Text("Message"), message: Text(model.alertMsg), dismissButton: .destructive(Text("Ok")))
        })
    }
}

struct CustomTextField : View {
    
    var image : String
    var placeHolder : String
    @Binding var txt : String

    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            
            Image(systemName: image)
                .font(.system(size: 24))
                .foregroundColor(Color("black"))
                .frame(width: 60, height: 60)
                .background(Color("lightpink"))
                .clipShape(Circle())
                
            
            ZStack{
                
                if (placeHolder) == "Password" || (placeHolder) == "Re-Enter"{
                   
                    SecureField("", text: $txt)
                        .foregroundColor(Color("black"))

                        
                }
                else{
                    TextField("", text: $txt)
                        .foregroundColor(Color("black"))
                    
                }
            }
                .padding(.horizontal)
                .padding(.leading,65)
                .frame(height: 60)
            .background(Color("darkpink").opacity(0.2))
                .clipShape(Capsule())
                
            
        }
        .padding(.horizontal)
    }
}

struct SignUpView : View {
    
    @ObservedObject var model : ModelData
    
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
            
            VStack{
                
                Spacer(minLength: 0)
                
                ZStack{
                    
                    if UIScreen.main.bounds.height < 750{
                        
                        Image("logo")
                            .resizable()
                            .frame(width: 200, height: 200)
                    }
                    else{
                        Image("logo")
                            .resizable()
                            .frame(width: 200, height: 200)
                    }
                }
                    //.padding(.horizontal)
                    //.padding(.vertical,20)
                    //.background(Color.white.opacity(0.2))
                    //.cornerRadius(30)
                    //.padding(.top)
                
                VStack(spacing: 4){
                    
                    HStack(spacing: 0){
                        
                        Text("New")
                            .font(.system(size: 35, weight: .heavy))
                            .foregroundColor(Color("lightpink"))
                        
                        Text("Profile")
                            .font(.system(size: 35, weight: .heavy))
                            .foregroundColor(Color("darkpink"))
                    }
                    
                    Text("Create a profile for you !!!")
                        .foregroundColor(Color("lightpink"))
                        .fontWeight(.heavy)
                }
                .padding(.top)
                
                VStack(spacing: 20){
                    
                    CustomTextField(image: "person", placeHolder: "Email", txt: $model.email_SignUp)
                    
                    CustomTextField(image: "lock", placeHolder: "Password", txt: $model.password_SignUp)
                    
                    CustomTextField(image: "lock", placeHolder: "Re-Enter", txt: $model.reEnterPassword)
                }
                .padding(.top)
                
                Button(action: model.signUp) {
                    
                    Text("SIGNUP")
                        .fontWeight(.bold)
                        .foregroundColor(Color("black"))
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color("lightpink"))
                        .clipShape(Capsule())
                }
                .padding(.vertical,22)
                
                Spacer(minLength: 0)
            }
            
            Button(action: {model.isSignUp.toggle()}) {
                
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.6))
                    .clipShape(Circle())
            }
            .padding(.trailing)
            .padding(.top,10)
            
            if model.isLoading{
                
                LoadingView()
            }
        })
        .background(Color("background").ignoresSafeArea(.all, edges: .all))
        .alert(isPresented: $model.alert, content: {
            
            Alert(title: Text("Message"), message: Text(model.alertMsg), dismissButton: .destructive(Text("Ok"), action: {
                 
                // if email link sent means closing the signupView....
                
                if model.alertMsg == "Email Verification Has Been Sent !!! Verify Your Email ID !!!"{
                    
                    model.isSignUp.toggle()
                    model.email_SignUp = ""
                    model.password_SignUp = ""
                    model.reEnterPassword = ""
                }
                
            }))
        })
    }
}

class ModelData : ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var isSignUp = false
    @Published var email_SignUp = ""
    @Published var password_SignUp = ""
    @Published var reEnterPassword = ""
    @Published var isLinkSend = false
    @Published var alert = false
    @Published var alertMsg = ""
    

    
    @AppStorage("log_Status") var status = false
    @Published var isLoading = false
    
    func resetPassword(){
        
        let alert = UIAlertController(title: "Reset Password", message: "Enter Your E-Mail ID To Reset Your Password", preferredStyle: .alert)
        
        alert.addTextField { (password) in
            password.placeholder = "Email"
            
        }
        
        let proceed = UIAlertAction(title: "Reset", style: .default) { (_) in
            
            if alert.textFields![0].text! != ""{
                
                withAnimation{
                    
                    self.isLoading.toggle()
                }
                
                Auth.auth().sendPasswordReset(withEmail: alert.textFields![0].text!) { (err) in
                    
                    withAnimation{
                        
                        self.isLoading.toggle()
                    }
                    
                    if err != nil{
                        self.alertMsg = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }
                    
                    // ALerting User...
                    self.alertMsg = "Password Reset Link Has Been Sent !!!"
                    self.alert.toggle()
                }
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(proceed)
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
    }
    
    func login(){
        
        if email == "" || password == ""{
            
            self.alertMsg = "Fill the contents properly !!!"
            self.alert.toggle()
            return
        }
        
        withAnimation{
            
            self.isLoading.toggle()
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
            
            withAnimation{
                
                self.isLoading.toggle()
            }
            
            if err != nil{
                
                self.alertMsg = err!.localizedDescription
                self.alert.toggle()
                return
            }

            let user = Auth.auth().currentUser
            
            if !user!.isEmailVerified{
                
                self.alertMsg = "Please Verify Email Address!!!"
                self.alert.toggle()
                try! Auth.auth().signOut()
                
                return
            }
            
            withAnimation{
                
                self.status = true
            }
        }
    }

    func signUp(){

        if email_SignUp == "" || password_SignUp == "" || reEnterPassword == ""{
            
            self.alertMsg = "Fill contents proprely!!!"
            self.alert.toggle()
            return
        }
        
        if password_SignUp != reEnterPassword{
            
            self.alertMsg = "Password Mismatch !!!"
            self.alert.toggle()
            return
        }
        
        withAnimation{
            
            self.isLoading.toggle()
        }
        
        Auth.auth().createUser(withEmail: email_SignUp, password: password_SignUp) { (result, err) in
            
            withAnimation{
                
                self.isLoading.toggle()
            }
            
            if err != nil{
                self.alertMsg = err!.localizedDescription
                self.alert.toggle()
                return
            }
            
            result?.user.sendEmailVerification(completion: { (err) in
                
                if err != nil{
                    self.alertMsg = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                self.alertMsg = "Email Verification Has Been Sent !!! Verify Your Email ID !!!"
                self.alert.toggle()
            })
        }
    }

    func logOut(){
        
        try! Auth.auth().signOut()
        
        withAnimation{
            
            self.status = false
        }
        
        email = ""
        password = ""
        email_SignUp = ""
        password_SignUp = ""
        reEnterPassword = ""
    }
    
}

struct LoadingView : View {
    
    @State var animation = false
    
    var body: some View{
        
        VStack{
            
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(Color("lightpink"),lineWidth: 8)
                .frame(width: 75, height: 75)
                .rotationEffect(.init(degrees: animation ? 360 : 0))
                .padding(50)
        }
        .background(Color.white)
        .cornerRadius(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.4).ignoresSafeArea(.all, edges: .all))
        .onAppear(perform: {
            
            withAnimation(Animation.linear(duration: 1)){
                
                animation.toggle()
            }
        })
    }
}


