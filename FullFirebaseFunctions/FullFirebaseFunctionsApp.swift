//
//  FullFirebaseFunctionsApp.swift
//  FullFirebaseFunctions
//
//  Created by Alexander Sobolev on 17.03.2023.
//

import SwiftUI
import Firebase

@main
struct FullFirebaseFunctionsApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
    var body: some Scene {
        WindowGroup {
          NavigationStack {
            RootView()
          }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

