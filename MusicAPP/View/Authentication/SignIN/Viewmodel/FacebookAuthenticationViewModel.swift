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
    
    @AppStorage("isLogin") var isLogin : Bool = false
    
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

//struct FacebookAuthenticationViewModel : UIViewRepresentable {
//    func makeCoordinator() -> Coordinator {
//        return Coordinator()
//    }
//
//    func makeUIView(context: UIViewRepresentableContext<FacebookAuthenticationViewModel>) -> FBLoginButton {
//        let button = FBLoginButton()
//        button.permissions = ["email", "public_profile"]
//        button.delegate = context.coordinator
//        return button
//    }
//
//
//    func updateUIView(_ uiView: FBLoginButton, context: UIViewRepresentableContext<FacebookAuthenticationViewModel>) {}
//
//    class Coordinator : NSObject, ObservableObject,LoginButtonDelegate{
//
//        func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
//            try! Auth.auth().signOut()
//            print("Did logout")
//        }
//
//        func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
//
//            if error != nil  {
//                print((error?.localizedDescription)!)
//                return
//            }
//
//            if AccessToken.current != nil {
//
//                let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
//                Auth.auth().signIn(with: credential) {(res ,  er) in
//
//                    if er != nil{
//                        print((er?.localizedDescription)!)
//                        return
//                    }
//
//                    print("SUCCES! ")
//                }
//            }
//        }
//    }
//}
