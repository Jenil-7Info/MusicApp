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
    
    var body: some View {
        Group {
            Group {
                if emailAuth.isLoggIN || phoneAuth.isLoggIN {
                    MusicTabbarView()
                } else {
                    SignInView()
                }
            }.onAppear {
                emailAuth.listenToAuthState()
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
