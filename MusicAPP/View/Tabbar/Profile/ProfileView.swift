//
//  ProfileView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 22/02/23.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var googleAuthVM : GoogleAutheticationViewModel
    
    var body: some View {
        
        VStack {
            
            AsyncImage(url: URL(string: googleAuthVM.profilePicUrl))
                .frame(width: 100, height: 100)
            
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

struct ProfileView_Previews: PreviewProvider {
    
    @EnvironmentObject var googleVM : GoogleAutheticationViewModel
    
    static var previews: some View {
        ProfileView()
           // .environmentObject(googleVM)
    }
}

