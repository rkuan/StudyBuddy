//
//  StudyRoom.swift
//  StudyBuddy
//
//  Created by Raymond Kuan on 2/19/21.
//

import SwiftUI

struct StudyRoom: View {
    var body: some View {
        Study()
    }
}

struct StudyRoom_Previews: PreviewProvider {
    static var previews: some View {
        StudyRoom()
    }
}


struct Study: View {
    var body: some View {
       
        VStack{
            // vertical stack
            Text("create a room")
                .font(.system(size: 30, weight: .bold))
                .position(x: 207, y: 50)
            Text("select a study mode:")
                .foregroundColor(.black)
            
        }
    }
}
