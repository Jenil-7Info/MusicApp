//
//  OTPViewModel.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 06/03/23.
//

import Foundation
import SwiftUI

class OTPViewModel: ObservableObject {
    
    @Published var otpField = "" {
        didSet {
            guard otpField.count <= 6,
                  otpField.last?.isNumber ?? true else {
                otpField = oldValue
                return
            }
        }
    }
    
    @Published var isTextFieldDisabled = false
    
    var otp1: String {
        get {
            guard otpField.count >= 1 else {
                return ""
            }
            return String(Array(otpField)[0])
        }
        set {
            self.otp1 = newValue
        }
    }
    var otp2: String {
        get {
            guard otpField.count >= 2 else {
                return ""
            }
            return String(Array(otpField)[1])
        }
        set {
            self.otp2 = newValue
        }
    }
    var otp3: String {
        get {
            guard otpField.count >= 3 else {
                return ""
            }
            return String(Array(otpField)[2])
        }
        set {
            self.otp3 = newValue
        }
    }
    var otp4: String {
        get {
            guard otpField.count >= 4 else {
                return ""
            }
            return String(Array(otpField)[3])
        }
        set {
            self.otp4 = newValue
        }
    }
    
    var otp5: String {
        get {
            guard otpField.count >= 5 else {
                return ""
            }
            return String(Array(otpField)[4])
        }
        set {
            self.otp5 = newValue
        }
    }
    
    var otp6: String {
        get {
            guard otpField.count >= 6 else {
                return ""
            }
            return String(Array(otpField)[5])
        }
        set {
            self.otp6 = newValue
        }
    }
    
    func isAllClearOtpVar(){
        self.otp1 = ""
        self.otp2 = ""
        self.otp3 = ""
        self.otp4 = ""
        self.otp5 = ""
        self.otp6 = ""
    }
}
