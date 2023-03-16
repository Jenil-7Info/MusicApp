//
//  MusicRootView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 09/03/23.
//

import SwiftUI
import FirebaseAuth

struct MusicRootView: View {
    
    @StateObject var googleAuth = GoogleAutheticationViewModel()
    @StateObject var emailAuth = EmailAuthenticationViewModel()
    @StateObject var phoneAuth = PhoneVerificationViewModel()
    
    //MARK: - Not Proper...
    var body: some View {
        Group {
            if phoneAuth.isVerifiy {
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
    }
}
