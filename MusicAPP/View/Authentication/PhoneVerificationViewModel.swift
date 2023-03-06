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
    @Published var code: String = ""
    @Published var errMessage: String = ""
    @Published var isAlert: Bool = false
    @Published var isVerifiy: Bool = false
    
    func sendOTP(phoneNumber: String) {
        
        let indianNumber = "+91\(phoneNumber)"
        self.phone = indianNumber
        debugPrint(phone)
        
        PhoneAuthProvider.provider().verifyPhoneNumber(indianNumber, uiDelegate: nil) { code, error in
            if let error = error {
                self.isAlert = true
                self.isVerifiy = false
                self.errMessage = error.localizedDescription
                debugPrint(error.localizedDescription)
            }
            else {
                self.isAlert = false
                self.isVerifiy = true
                self.code = code ?? "123456"
            }
        }
    }
}
