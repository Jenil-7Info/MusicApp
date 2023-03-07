//
//  PhoneVerificationViewModel.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 02/03/23.
//

import Foundation
import FirebaseAuth
import SwiftUI

class PhoneVerificationViewModel: ObservableObject {
    @Published var phone: String = ""
    @Published var Id: String = ""
    @Published var errMessage: String = ""
    @Published var isAlert: Bool = false
    @Published var isLoggIN: Bool = false
    @Published var isVerifiy: Bool = false
    
    func sendOTP(phoneNumber: String) {
        
        let indianNumber = "+91\(phoneNumber)"
        self.phone = indianNumber
        debugPrint(phone)
        
        PhoneAuthProvider.provider().verifyPhoneNumber(indianNumber, uiDelegate: nil) { id, error in
            if let error = error {
                self.isAlert = true
                self.isVerifiy = false
                self.errMessage = error.localizedDescription
                debugPrint(error.localizedDescription)
            }
            else {
                self.isAlert = false
                self.isVerifiy = true
                self.Id = id ?? ""
                debugPrint("code", id!)
            }
        }
    }
    
    func otpVerification(getOTP: String) {
        let candentital = PhoneAuthProvider.provider().credential(withVerificationID: self.Id, verificationCode: getOTP)
        
        Auth.auth().signIn(with: candentital) { result, error in
            if let error = error {
                self.isAlert = true
                self.isLoggIN = false
                self.errMessage = error.localizedDescription
                debugPrint(self.errMessage)
            } else {
                self.isLoggIN = true
                self.isAlert = false
                
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                
                return
            }
        }
    }
    
    func signOut() {
        do {
            self.isAlert = false
            self.isLoggIN = false
            
            UserDefaults.standard.set(false, forKey: "status")
            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
            
            try Auth.auth().signOut()
        } catch {
            self.isAlert = true
            self.errMessage = error.localizedDescription
            debugPrint("ERROR:- \(error.localizedDescription)")
        }
    }
}
