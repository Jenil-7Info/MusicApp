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
        
        var isLogginEmail: Bool = LoginVerification.EmailAndPassAuth.rawValue == emailAuthVM.verification
        
        VStack {
            
            if isLogginEmail {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(radius: 20, corners: .allCorners)
            } else {
                AsyncImage(url: URL(string: googleAuthVM.profilePicUrl))
                    .frame(width: 100, height: 100)
                    .cornerRadius(radius: 20, corners: .allCorners)
            }
            
            Text(isLogginEmail ? emailAuthVM.firstName : googleAuthVM.firstName)
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 20)
            
            Text(isLogginEmail ? emailAuthVM.lastName : googleAuthVM.lastName)
                .font(.title)
                .bold()
                .padding(.bottom, 20)
            
            Text(isLogginEmail ? emailAuthVM.email : googleAuthVM.email)
                .font(.title2)
                .bold()
                .padding(.bottom, 20)
            
            Button {
                if isLogginEmail {
                    self.emailAuthVM.signOut()
                } else {
                    self.googleAuthVM.signOut()
                }
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
            .navigationDestination(isPresented: $emailAuthVM.isLoggOut) {
                SignInView()
                    .navigationBarBackButtonHidden(true)
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

//MARK: - If User Email Authentication Login then this struct is Called...
//MARK: - Pandding...
struct EmailAndPassLoginProfileView: View {
    
    @State private var isPresentSignIN: Bool = false
    @StateObject var coreDataVM = DataModelController()
    @EnvironmentObject var emailAuthVM : EmailAuthenticationViewModel
    
    var body: some View {
        VStack {
            Image(systemName: emailAuthVM.image)
                .resizable()
                .frame(width: 80, height: 80)
            
            Text(emailAuthVM.firstName)
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 20)
            
            Text(emailAuthVM.lastName)
                .font(.title2)
                .bold()
                .padding(.bottom, 20)
            
            Text(emailAuthVM.email)
                .font(.title3)
                .bold()
                .padding(.bottom, 20)
            
            Text(emailAuthVM.phone)
                .font(.body)
                .bold()
                .padding(.bottom, 20)
            
            Button {
                emailAuthVM.signOut()
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
            .navigationDestination(isPresented: $emailAuthVM.isLoggOut) {
                withAnimation(.spring()) {
                    SignInView()
                        .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}
