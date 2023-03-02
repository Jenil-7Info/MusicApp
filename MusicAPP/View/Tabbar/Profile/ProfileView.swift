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
        //NOTE: - check the which use login method
        if emailAuthVM.verification == LoginVerification.EmailAndPassAuth.rawValue {
            EmailAndPassLoginProfileView()
        } else {
            GoogleOrOtherLoginProfileView()
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
               // emailAuthVM.signOut()
                self.isPresentSignIN.toggle()
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
            .navigationDestination(isPresented: $isPresentSignIN) {
                withAnimation(.spring()) {
                    SignInView()
                        .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}

//MARK: - If User Google Or Other PlatForm Use And Login the This Struct is Called...
struct GoogleOrOtherLoginProfileView: View {
    
    @EnvironmentObject var googleAuthVM : GoogleAutheticationViewModel
    
    var body: some View {
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
