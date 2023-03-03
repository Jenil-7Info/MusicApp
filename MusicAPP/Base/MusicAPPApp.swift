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
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var googleAuthVM = GoogleAutheticationViewModel()
    @StateObject var emailAuthVM = EmailAuthenticationViewModel()
    @StateObject var dataModel = DataModelController()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                //SignInView()
              //OTPView()
                MyView()
                //mainAfterView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(googleAuthVM) //use the all files GoogleAuthentication
            .environmentObject(emailAuthVM) //use the all files EmailAuthentication
            .environment(\.managedObjectContext, dataModel.contanier.viewContext)
                    //use the all files CoreData...
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
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
    }
}
