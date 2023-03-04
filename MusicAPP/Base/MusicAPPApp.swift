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
                SignInView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(googleAuthVM) //use the all files GoogleAuthentication
            .environmentObject(emailAuthVM) //use the all files EmailAuthentication
            .environment(\.managedObjectContext, dataModel.contanier.viewContext)
        }
    }
}
