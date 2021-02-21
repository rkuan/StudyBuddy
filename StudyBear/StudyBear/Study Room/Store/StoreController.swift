//
//  StoreController.swift
//  StudyBear
//
//  Created by Raymond Kuan on 2/21/21.
//

import Foundation
import SwiftUI


struct StoreController: View {
    @State private var push = "Store"

    var body: some View {
       
        ZStack {
            if (push == "Store") {
                Store(push: $push)
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            }
            if (push == "Closet") {
                Closet(push: $push)
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            }
        
    }
}
}
