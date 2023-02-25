//
//  MusicAPPApp.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 22/02/23.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

@main
struct MusicAPPApp: App {
    
    @State private var isLogin: Bool = true
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var googleAuthVM = GoogleAutheticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SignInView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(googleAuthVM)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
      -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
}
