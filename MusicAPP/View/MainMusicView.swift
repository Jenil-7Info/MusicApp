//
//  MusicMainView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 28/02/23.
//

import SwiftUI
import FirebaseAuth

struct MainMusicView: View {
    
    @EnvironmentObject var emailVM: EmailAuthenticationViewModel
    
    var body: some View {
        Group {
            if Auth.auth().currentUser != nil {
                MusicRootView()
            } else {
                SignInView()
            }
        }
        .onAppear {
            emailVM.listenToAuthState()
        }
    }
}

//struct MusicMainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainMusicView()
//            .environmentObject(GoogleAutheticationViewModel())
//            .environmentObject(EmailAuthenticationViewModel())
//    }
//}
