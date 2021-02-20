//
//  StudyRoomControl.swift
//  StudyBuddy
//
//  Created by Kayla Kelsall on 2/20/21.
//

import Foundation
import SwiftUI

struct StudyRoomControl: View {
    var body: some View {
        StudyRoom()
    }
}

struct StudyRoomControl_Previews: PreviewProvider {
    static var previews: some View {
        StudyRoomControl()
    }
}

struct StudyRoomControls: View {
    @State private var push = "Create a Room"

    var body: some View {
       
        ZStack {
            if (push == "Solo") {
                Solo(push: $push)
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            }

            if (push == "Buddy") {
                Buddy(push: $push)
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            }
            
            if (push == "Class") {
                Class(push: $push)
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            }
        }
        .background(Color("background"))
    }
}
