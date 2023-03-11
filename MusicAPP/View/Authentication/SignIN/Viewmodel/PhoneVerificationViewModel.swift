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
    @Published var otpText: String = ""
    @Published var errMessage: String = ""
    @Published var isAlert: Bool = false
    @Published var isVerifiy: Bool = false
    @AppStorage("ID") var ID: String = ""
    
    //MARK: - Send OTP Code...
    func sendOTP() {
        
        let number = "+91\(phone)"
        
        PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil) { id, error in
            if let error = error {
                DispatchQueue.main.async {
                    withAnimation {
                        self.isAlert = true
                        self.isVerifiy = false
                    }
                    self.errMessage = error.localizedDescription
                    debugPrint(error.localizedDescription)
                }
            }
            else {
                DispatchQueue.main.async {
                    withAnimation {
                        self.isAlert = false
                        self.isVerifiy = true
                    }
                    self.ID = id!
                    debugPrint("code:-  \(self.ID)")
                }
            }
        }
    }
    
    //MARK: - Otp Verification Code...
    func otpVerification() {
        
        debugPrint("getUP",otpText)
        debugPrint("ID",ID)
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: ID, verificationCode: otpText)
        
        Auth.auth().signIn(with: credential){ result, error in
            if let error = error {
                DispatchQueue.main.async {
                    withAnimation {
                        self.isAlert = true
                        self.isVerifiy = false
                    }
                    self.errMessage = error.localizedDescription
                    debugPrint(self.errMessage)
                }
            } else {
                DispatchQueue.main.async {
                    withAnimation {
                        self.isVerifiy = true
                        self.isAlert = false
                    }
                }
            }
        }
    }
    
    //MARK: - Resend OTP Code...
    func resendOTPCode() {
        sendOTP()
    }
    
    //MARK: -  Sign Out Code...
    func signOut() {
        do {
            self.isAlert = false
            self.isVerifiy = false
            try Auth.auth().signOut()
            
        } catch {
            self.isAlert = true
            self.errMessage = error.localizedDescription
            debugPrint("ERROR:- \(error.localizedDescription)")
        }
    }
}
