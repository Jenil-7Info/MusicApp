//
//  SignUpMainView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 02/03/23.
//

import SwiftUI

struct MiddleSignUpView : View {
    
    @State private var isPresentSignIN: Bool = false
    
    var body: some View {
        VStack {
            //MARK: - Heading Title...
            ApplicationTitle()
                .shadow(color: .black.opacity(0.5), radius: 10)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            
            //MARK: - MiddleView...
            SignUpTextFiledView()
            
            //MARK: - BottomView...
            HStack {
                Text("Alrady Account?")
                    .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
                    .foregroundColor(.white)
                
                Button {
                    self.isPresentSignIN.toggle()
                } label: {
                    Text("Sign In")
                        .font(.festerFont(customFontName: .FesterBold, fontSize: 20))
                        .foregroundColor(.white)
                }
                .navigationDestination(isPresented: $isPresentSignIN) {
                    SignInView()
                        .navigationBarBackButtonHidden(true)
                }
            }
            .padding(.top, 40)
        }
    }
}

struct SignUpMainView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(EmailAuthenticationViewModel())
    }
}
