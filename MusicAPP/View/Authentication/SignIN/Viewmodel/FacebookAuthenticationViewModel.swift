//
//  FacebookAuthenticationViewModel.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 07/04/23.
//

import SwiftUI
import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseCore
import FirebaseAuth

class FacebookAuthenticationViewModel: ObservableObject {
    
    @AppStorage("login_Status") var isLogin: Bool = false
    
    func facebookLogin() {
        let premission = ["public_profile", "email"]
        let fbLoginManager = LoginManager()
        
        fbLoginManager.logIn(permissions: premission, from: nil) { (result, error) in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                return
            }
            
            guard let _ = AccessToken.current else {
                print("Failed to get access token")
                return
            }
            
            if result?.isCancelled == true {
                print("User canceled")
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
            
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                if let error = error {
                    print("Login error: \(error.localizedDescription)")
                    let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okayAction)
                    print("asd")
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
            debugPrint("Error:- Something Problem")
        }
    }
}
