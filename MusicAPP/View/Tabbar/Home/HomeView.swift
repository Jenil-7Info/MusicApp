//
//  HomeView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 22/02/23.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - Varibles..
    @State private var isNotifivation: Bool = false
    @State private var isSetting: Bool = false
    
    //MARK: - Header view...
    var header: some View {
        HStack {
            Text("Music")
                .font(.festerFont(customFontName: .FesterTrialBold, fontSize: 36))
            
            Spacer()
            
            Button {
                self.isNotifivation.toggle()
            } label: {
                Image("notification")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(width: dynamicWidth/14, height: dynamicHeight/25)
                    .padding(.trailing)
            }
            
            Button {
                self.isSetting.toggle()
            } label: {
                Image("setting")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(width: dynamicWidth/14, height: dynamicHeight/25)
            }
        }
    }
    
    //MARK: - Body...
    var body: some View {
        VStack {
         header
            .padding(.horizontal, 20)
            
            ScrollView {
                HStack {
                    Text("Last Play")
                        .font(.festerFont(customFontName: .FesterTrialSemiBold, fontSize: 24))
                    
                    Spacer()
                }
                .padding(EdgeInsets(top: 30, leading: 20, bottom: 12, trailing: 20))
                
                ScrollView(.horizontal) {
                    
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        LastPlaycollectionView()
    }
}

struct LastPlaycollectionView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.black.opacity(0.5))
            .frame(width: dynamicWidth/2.3, height: dynamicHeight/2.9)
            .overlay {
                VStack {
                    Image("Albam-2")
                        .resizable()
                        .aspectRatio(1.2,contentMode: .fill)
                        .frame(width: dynamicWidth/2.3, height: dynamicHeight/6)
                        .cornerRadius(radius: 20, corners: [.topLeft, .topRight])
                        .padding(.bottom)
                    Text("Discovery Weekly")
                        .foregroundColor(.white)
                        .font(.festerFont(customFontName: .FesterTrialSemiBold, fontSize: 20))
                    Text("nddnknksndkndfndnfknsdfkdsfndsnfdsnfkdnfkdnfknd")
                        .lineLimit(2)
                        .foregroundColor(.white)
                        .padding(5)
                }
            }
    }
}
