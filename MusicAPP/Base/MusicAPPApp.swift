//
//  MusicAPPApp.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 22/02/23.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn
import FBSDKCoreKit

@main
struct MusicAPPApp: App {
    
    @StateObject var googleAuthVM = GoogleAutheticationViewModel()
    @StateObject var emailAuthVM = EmailAuthenticationViewModel()
    @StateObject var appleAuthVM = AppleAutheniticationViewModel()
    @StateObject var facebookauthVM = FacebookAuthenticationViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MusicRootView()
                    .onAppear(){
                        ApplicationDelegate.shared.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
                    }
            }
            .preferredColorScheme(.dark)
            .environmentObject(googleAuthVM) //use the all files GoogleAuthentication
            .environmentObject(emailAuthVM) //use the all files EmailAuthentication
            .environmentObject(appleAuthVM) //use the all files EmailAuthentication
            .environmentObject(facebookauthVM)//use the all files facebookAuthentication
        }
    }
}
