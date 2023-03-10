//
//  SignUpView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 22/02/23.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        ZStack {
            GeometryReader { GeometryProxy in
                Image("Music_65%")
                    .resizable()
                    .scaledToFill()
                    .frame(width: GeometryProxy.size.width, height: GeometryProxy.size.height)
                
                Color.white.opacity(0.05)
                Color.black.opacity(0.25)
            }
            //MARK: - backGround Image and Colors...
            MiddleSignUpView()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(EmailAuthenticationViewModel())
    }
}





