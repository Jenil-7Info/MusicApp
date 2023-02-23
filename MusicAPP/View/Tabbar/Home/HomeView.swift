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
    @StateObject var lastPlayCollectionVM = LastPlayCollectionViewModel()
    @StateObject var favArtitsImgVM = YourFavArtitsCollectionViewModel()
    
    //MARK: - Header view...
    var header: some View {
        HStack {
            
            Text("Music")
                .font(.festerFont(customFontName: .FesterBold, fontSize: 36))
                .overlay {
                    GradientColors.orangeGradient
                        .mask {
                            Text("Music")
                                .font(.festerFont(customFontName: .FesterBold, fontSize: 36))
                        }
                }
            
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
            
            ScrollView(.vertical) {
                
                //NOTE: - Last Play...
                HStack {
                    Text("Last Play")
                        .font(.festerFont(customFontName: .FesterTrialSemiBold, fontSize: 24))
                    
                    Spacer()
                }
                .padding(EdgeInsets(top: 30, leading: 20, bottom: 12, trailing: 20))
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(lastPlayCollectionVM.LastPlayCollectionManger) { collection in
                            LastPlaycollectionView(img: collection.img, title: collection.name, des: collection.des)
                        }
                    }
                }
                .scrollIndicators(.never)
                .padding(.leading)
                
                //NOTE: - Your Favourit artits...
                HStack {
                    Text("Your Favourit artists")
                        .font(.festerFont(customFontName: .FesterTrialSemiBold, fontSize: 24))
                    
                    Spacer()
                }
                .padding(EdgeInsets(top: 30, leading: 20, bottom: 12, trailing: 20))
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(favArtitsImgVM.ArtitsImageCollectionManger) { artist in
                            FavArtistsCircleView(img: artist.img)
                        }
                    }
                }
                .scrollIndicators(.never)
                .padding(.leading)
                
                //NOTE: - Made For You...
                HStack {
                    Text("Made For You")
                        .font(.festerFont(customFontName: .FesterTrialSemiBold, fontSize: 24))
                    
                    Spacer()
                }
                .padding(EdgeInsets(top: 30, leading: 20, bottom: 12, trailing: 20))
                
                //MARK: - Baki....
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(lastPlayCollectionVM.LastPlayCollectionManger) { collection in
                            LastPlaycollectionView(img: collection.img, title: collection.name, des: collection.des)
                        }
                    }
                }
                .scrollIndicators(.never)
                .padding(.leading)
                
            }
            .scrollIndicators(.never)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        YourcollectionPlayListRectangle(img: "", title: "", totalSong: "")
    }
}

struct YourcollectionPlayListRectangle: View {
    
    @State var img: String
    @State var title: String
    @State var totalSong: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.gray.opacity(0.5))
            .frame(width: dynamicWidth/2.2, height: dynamicHeight/2.9)
            .overlay {
                    Image("pop")
                        .resizable()
                        .aspectRatio(1.2,contentMode: .fill)
                        .frame(width: dynamicWidth/2.2, height: dynamicHeight/6)
                
                VStack(spacing: 10) {
                    
                    Spacer()
                    
                    Text("title")
                        .foregroundColor(.white)
                        .font(.festerFont(customFontName: .FesterTrialSemiBold, fontSize: 20))
                    
                    HStack(spacing: 3) {
                        Image(systemName: "music.note")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .frame(width: 12, height: 18)
                        Text("3002")
                            .lineLimit(2)
                            .foregroundColor(.white)
                        Text("Tracker")
                            .lineLimit(2)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
    }
}
