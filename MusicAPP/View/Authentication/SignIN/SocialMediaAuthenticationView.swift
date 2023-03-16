//
//  SocialMediaAuthenticationView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 04/03/23.
//

import SwiftUI


struct SocialMediaAuthenticationView: View {
    
    @State private var bgColorFloat: CGFloat = 0.5
    @EnvironmentObject var googleAuthVM : GoogleAutheticationViewModel
    
    var body: some View {
        VStack {
            Text("- - - -  Login With  - - - -")
                .font(.festerFont(customFontName: .FesterMedium, fontSize: 20))
                .foregroundColor(.white)
            
            HStack(spacing: 40) {
                
                //MARK: - Facebook Authentication
                Button {
                    
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
                .navigationDestination(isPresented: $googleAuthVM.isLoggedIn) {
                    MusicTabbarView()
                        .navigationBarBackButtonHidden(true)
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
    }
}
