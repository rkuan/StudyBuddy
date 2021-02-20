//
//  Class.swift
//  StudyBuddy
//
//  Created by Kayla Kelsall on 2/20/21.
//

import Foundation
import SwiftUI

struct Class: View{
    @Binding var push: String
    var body: some View{
        VStack(spacing: 15){
            ZStack{
                HStack{
                    Image("").resizable().frame(width: 250, height: 150)
                    Spacer()
                }
            }
        }
    }
}
