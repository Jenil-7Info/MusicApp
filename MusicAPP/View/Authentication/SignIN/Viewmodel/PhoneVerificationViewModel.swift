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
    @Published var errMessage: String = ""
    @Published var isAlert: Bool = false
    @Published var isLoggIN: Bool = false
    @Published var isVerifiy: Bool = false
    @AppStorage("ID") var ID: String = ""
    
    //MARK: - Send OTP Code...
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
                self.ID = id!
                debugPrint("code:-  \(self.ID)")
            }
        }
    }
    
    //MARK: - Otp Verification Code...
    func otpVerification(getOTP: String) {
        
        debugPrint("getUP",getOTP)
        debugPrint("ID",ID)
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: ID, verificationCode: getOTP)
        
        Auth.auth().signIn(with: credential){ result, error in
            if let error = error {
                self.isAlert = true
                self.isLoggIN = false
                self.errMessage = error.localizedDescription
                debugPrint(self.errMessage)
            } else {
                DispatchQueue.main.async {
                    self.isLoggIN = true
                    self.isAlert = false
                }
            }
        }
    }
    
    //MARK: -  Sign Out Code...
    func signOut() {
        do {
            self.isAlert = false
            self.isLoggIN = false
            try Auth.auth().signOut()
            
        } catch {
            self.isAlert = true
            self.errMessage = error.localizedDescription
            debugPrint("ERROR:- \(error.localizedDescription)")
        }
    }
}
