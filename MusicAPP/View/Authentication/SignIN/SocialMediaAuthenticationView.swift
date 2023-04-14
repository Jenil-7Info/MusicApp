//
//  SocialMediaAuthenticationView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 04/03/23.
//

import SwiftUI
import AuthenticationServices

struct SocialMediaAuthenticationView: View {
    
    @State private var bgColorFloat: CGFloat = 0.5
    @EnvironmentObject var googleAuthVM : GoogleAutheticationViewModel
    @EnvironmentObject var appleAuthVM : AppleAutheniticationViewModel
    @EnvironmentObject var facebookVM : FacebookAuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("- - - -  Login With  - - - -")
                .font(.festerFont(customFontName: .FesterMedium, fontSize: 20))
                .foregroundColor(.white)
            
            HStack(spacing: 40) {
                
            //MARK: - Apple ID Authentication -> [this btn Not perfect]
//                SignInWithAppleButton(SignInWithAppleButton.Label.continue) { request in
//                    self.appleAuthVM.handleSigInWithApple(request)
//                } onCompletion: { result in
//
//                    appleAuthVM.handleSigInWithAppleComplation(result)
//
//                    //Handle the Complitions
//                    switch result {
//                    case .success(let sucess):
//                        debugPrint("Sucess: \(sucess)")
//                    case .failure(let err):
//                        debugPrint(err.localizedDescription)
//                    }
//                }
//                .frame(width: 30, height: 30)
//                .padding()

                
                //MARK: - Google Authentication
                Button {
                    googleAuthVM.signIn()
                } label: {
                    Image("google")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                        .background {
                            Circle()
                                .fill(.white.opacity(bgColorFloat))
                        }
                }
                .alert("Alert", isPresented: $googleAuthVM.isAlert) {
                    Button("OK", role: .cancel) {
                        dismiss.callAsFunction()
                    }
                } message: {
                    Text(googleAuthVM.errorMessage)
                }
                
                //MARK: - Facebook Authentication
                Button {
                    facebookVM.facebookLogin()
                } label: {
                    Image("facebook")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                        .background {
                            Circle()
                                .fill(.white.opacity(bgColorFloat))
                        }
                }
                .alert("Alert", isPresented: $facebookVM.isAlert) {
                    Button("OK", role: .cancel) {
                        dismiss.callAsFunction()
                    }
                } message: {
                    Text(facebookVM.errMessage)
                }

                
                //MARK: - Apple Authentication
                Button {
                    appleAuthVM.startSignInWithAppleFlow()
                } label: {
                    Image("apple")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                        .background {
                            Circle()
                                .fill(.white.opacity(bgColorFloat))
                        }
                }
                .alert("Alert", isPresented: $appleAuthVM.isError) {
                    Button("OK", role: .cancel) {
                        dismiss.callAsFunction()
                    }
                } message: {
                    Text(appleAuthVM.errMessage)
                }
                
                //MARK: - Github Authentication
                Button {
                    
                } label: {
                    Image("GitHub")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                        .background {
                            Circle()
                                .fill(.white.opacity(bgColorFloat))
                        }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct SocialMediaAuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        SocialMediaAuthenticationView()
            .environmentObject(GoogleAutheticationViewModel())
            .environmentObject(AppleAutheniticationViewModel())
            .environmentObject(FacebookAuthenticationViewModel())
    }
}
