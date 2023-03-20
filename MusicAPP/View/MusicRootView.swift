//
//  MusicRootView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 09/03/23.
//

import SwiftUI
import FirebaseAuth

struct MusicRootView: View {
    
    @AppStorage("login_Status") var isLogin: Bool = false
    
    @StateObject var googleAuth = GoogleAutheticationViewModel()
    @StateObject var emailAuth = EmailAuthenticationViewModel()
    @StateObject var phoneAuth = PhoneVerificationViewModel()
    
    //MARK: - Not Proper...
    var body: some View {
        Group {
            if isLogin {
                MusicTabbarView()
            } else {
                SignInView()
            }
        }
    }
}

struct MusicRootView_Previews: PreviewProvider {
    static var previews: some View {
        MusicRootView()
            .environmentObject(GoogleAutheticationViewModel())
            .environmentObject(EmailAuthenticationViewModel())
            .environmentObject(PhoneVerificationViewModel())
            .environmentObject(AppleAutheniticationViewModel())
    }
}
