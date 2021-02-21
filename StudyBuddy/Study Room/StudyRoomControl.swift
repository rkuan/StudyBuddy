//
//  StudyRoomControl.swift
//  StudyBuddy
//
//  Created by Kayla Kelsall on 2/20/21.
//

import Foundation
import SwiftUI

struct StudyRoomControls: View {
    @State private var push = "StudyRoom"

    var body: some View {
       
        ZStack {
            if (push == "StudyRoom") {
                Study(push: $push)
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            }
            if (push == "Solo") {
                Solo(push: $push)
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            }

            if (push == "Buddy") {
                Buddy(push: $push)
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            }
            
            if (push == "Class") {
                Class(push: $push)
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            }
        }
        .background(Color("background"))
    }
}
