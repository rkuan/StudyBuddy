//
//  StudyBearApp.swift
//  StudyBear
//
//  Created by Raymond Kuan on 2/20/21.
//

import SwiftUI
import Firebase

@main
struct StudyBearApp: App {
    @UIApplicationDelegateAdaptor(Delegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            Opening()
        }
    }
}


// Connect to Firebase

class Delegate : NSObject,UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
