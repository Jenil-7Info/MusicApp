//
//  EmailAuthenticationViewModel.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 28/02/23.
//

import Foundation
import FirebaseAuth

//MARK: - Email And Password Authentication
class EmailAuthenticationViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var isLoggIN: Bool = false
    @Published var verification: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var image: String = ""
    @Published var isAlert: Bool = false
    @Published var errMessage: String = ""
    
    //Get the User ID
    var user: User? {
        didSet {
            objectWillChange.send()
        }
    }
    
    func listenToAuthState() {
        auth.addStateDidChangeListener { [weak self] _ , user in
            guard let self = self else { return }
            self.user = user
        }
    }
    
    func resetPassEmailVerification(emailAdd: String) {
        DispatchQueue.main.async {
            self.auth.sendPasswordReset(withEmail: emailAdd) { err in
                if err == nil {
                    self.isAlert = false
                }
                else {
                    self.isAlert = true
                    self.errMessage = err!.localizedDescription
                    debugPrint("RESET PASSWORD FAILED!!")
                }
            }
        }
    }
    
    //Sign In the User, when his register useing email or password...
    func signIn(email: String, pass: String, verification: LoginVerification) {
        
        auth.signIn(withEmail: email, password: pass) { result, err in
            
            guard result != nil, err == nil else {
                self.errMessage = err?.localizedDescription ?? "Sign In Failed!!"
                debugPrint("ERROR:- \(err!.localizedDescription)")
                return
            }
            
            DispatchQueue.main.async {
                self.isLoggIN = true
                self.isAlert = false
                self.verification = verification.rawValue
            }
        }
        
//        auth.signIn(withEmail: email, password: pass) { result, error in
//            guard result != nil , error == nil else {
//                self.isAlert = true
//                self.errMessage = error?.localizedDescription ?? "ERROR: Somethings Wrong!"
//                debugPrint("PROMBLEM SETMENT:- SOMETHINGS WRONG! \(String(describing: error?.localizedDescription))")
//                return
//            }
//
//            //Success
//            DispatchQueue.main.async {
//                self.isLoggIN = true
//                self.isAlert = false
//                self.verification = verification.rawValue
//            }
//        }
    }
    
    //register the user
    func signUp(_ image: String ,_ fName: String, _ lName: String ,email: String, pass: String, verification: LoginVerification) {
        auth.createUser(withEmail: email, password: pass) { result, error in
            guard result != nil , error == nil else { return }
            
            //Success
            DispatchQueue.main.async {
                self.image = image
                self.firstName = fName
                self.lastName = lName
                self.email = email
                self.isLoggIN = true
                self.isAlert = false
                self.verification = verification.rawValue
            }
        }
    }
    
    //logout the user...
    func signOut() {
        do {
            self.isLoggIN = false
            self.isAlert = false
            try auth.signOut()
        } catch {
            self.errMessage = error.localizedDescription
            self.isAlert = true
            debugPrint("PROMBLEM SETMENT:- SIGNOUT FAILED!! \(String(describing: error.localizedDescription))")
        }
    }
}
