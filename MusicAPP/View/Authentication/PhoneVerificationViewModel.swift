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
    @Published var phone: String = "1234567890"
    @Published var code: String = ""
    @Published var errMessage: String = ""
    @Published var isAlert: Bool = false
    @Published var isVerifiy: Bool = false
    
    func sendCode() {
        PhoneAuthProvider.provider().verifyPhoneNumber(phone, uiDelegate: nil) { code, error in
            if let error = error {
                self.isAlert = true
                self.errMessage = error.localizedDescription
                debugPrint(error.localizedDescription)
            }
            self.code = code ?? ""
            self.isVerifiy = true
        }
    }
}
