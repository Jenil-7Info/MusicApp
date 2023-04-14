//
//  FacebookAuthenticationViewModel.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 07/04/23.
//

import SwiftUI
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseCore
import FirebaseAuth

class FacebookAuthenticationViewModel: ObservableObject {
    
    @AppStorage("login_Status") var isLogin: Bool = false
    @Published var errMessage: String = ""
    @Published var isAlert: Bool = false
    
    func facebookLogin() {
        let fbLoginManager = LoginManager()
        
        fbLoginManager.logIn(permissions: ["public_profile", "email"], from: nil) { (result, error) in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                return
            }
            
            guard let currentAccesToken = AccessToken.current else {
                print("Failed to get access token")
                return
            }
            
            if result?.isCancelled == true {
                print("User canceled")
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: currentAccesToken.tokenString)
            
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                
                if let error = error {
                    self.isAlert = true
                    self.errMessage = "ERROR: Firebase SignIn Problem, \(error.localizedDescription)"
                    print("ERROR: LOGIN PROBLEM, \(error.localizedDescription)")
                    return
                }
                
                self.isLogin = true
                return
            })
        }
    }
    
    func facebookLogout() {
        do {
            try Auth.auth().signOut()
            self.isLogin = false
        } catch {
            self.isAlert = true
            self.errMessage = "ERROR: Firebase SignOut Problem, \(error.localizedDescription)"
            debugPrint("Error:- LOGOUT PROBLEM, \(error.localizedDescription)")
        }
    }
}
