//
//  ProfileControl.swift
//  StudyBuddy
//
//  Created by Raymond Kuan on 2/20/21.
//

import SwiftUI

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

    var body: some View {
       
        ZStack {
            if (push == "Profile") {
                Profile(push: $push)
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
        }
        .background(Color("background"))
    }
}
