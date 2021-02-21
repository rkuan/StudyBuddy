//
//  ProfileControl.swift
//  StudyBuddy
//
//  Created by Raymond Kuan on 2/20/21.
//

import SwiftUI
import Firebase
import FirebaseDatabase

struct ProfileControl: View {
    var body: some View {
        ProfileControls()
    }
}

struct ProfileControl_Previews: PreviewProvider {
    static var previews: some View {
        ProfileControl()
    }
}

struct ProfileControls: View {
    @State private var push = "Profile"
    @State private var didrun = true
    @State var masterdict: Dictionary<String, String> = [:]

    var body: some View {
       
        ZStack {
            if (push == "Profile") {
                Profile(push: $push, didrun: $didrun)
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            }

            if (push == "Setting") {
                Setting(push: $push)
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            }
            
            if (push == "Addview") {
                AddView(push: $push)
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            }
            if (push == "Party") {
                Celebrate(push: $push)
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            }
        }
        .background(Color("background"))
    }
    
}


