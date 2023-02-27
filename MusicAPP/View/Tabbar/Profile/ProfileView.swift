//
//  ProfileView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 22/02/23.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var googleAuthVM : GoogleAutheticationViewModel
    @EnvironmentObject var emailAuthVM : EmailAuthenticationViewModel
    
    var body: some View {
       
        if emailAuthVM.verification == LoginVerification.EmailAndPassAuth.rawValue {
            VStack {
                
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 150, height: 150)
                
                Text("Demo")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 20)
                
                Button {
                    self.emailAuthVM.signOut()
                } label: {
                    Text("Sign Out")
                        .foregroundColor(.red)
                        .bold()
                }
                .padding()
                .background {
                        Capsule()
                        .fill(.red.opacity(0.15))
                }
            }
        } else {
            VStack {
                
                AsyncImage(url: URL(string: googleAuthVM.profilePicUrl))
                    .frame(width: 100, height: 100)
                    .cornerRadius(radius: 20, corners: .allCorners)
                
                Text(googleAuthVM.givenName)
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 20)
                
                Button {
                    self.googleAuthVM.signOut()
                } label: {
                    Text("Sign Out")
                        .foregroundColor(.red)
                        .bold()
                }
                .padding()
                .background {
                        Capsule()
                        .fill(.red.opacity(0.15))
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(GoogleAutheticationViewModel())
            .environmentObject(EmailAuthenticationViewModel())
    }
}

