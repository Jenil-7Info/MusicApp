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
    @State private var isSelectMusic: Bool = false
    @StateObject var lastPlayCollectionVM = LastPlayCollectionViewModel()
    @StateObject var favArtitsImgVM = YourFavArtitsCollectionViewModel()
    @StateObject var madePlayListVM = MadeForYouCollectionViewModel()
    @StateObject var tipsViewModel = TipsViewModel()
    @StateObject var discoverVM = DiscoverViewModel()
    @StateObject var audioManger = AudioManger()
    @State var isPreview: Bool = false
    
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
                    .frame(width: 25, height: 28)
                    .padding(.trailing)
            }
            
            Button {
                self.isSetting.toggle()
            } label: {
                Image("setting")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
            }
        }
    }
    
    //MARK: - Body
    var body: some View {
        ZStack {
            VStack {
             
            //MARK: - Headering
             header
                .padding(.horizontal, 20)
                
                ScrollView(.vertical) {
                    
                    //MARK: - Last Play
                    HStack {
                        Text("Last Play")
                            .font(.festerFont(customFontName: .FesterTrialSemiBold, fontSize: 24))
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 30, leading: 20, bottom: 12, trailing: 20))
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(lastPlayCollectionVM.LastPlayCollectionManger) { collection in
                                LastPlaycollectionView(title: collection.title, duration: collection.duration, track: collection.track, img: collection.img, des: collection.des)
                            }
                        }
                    }
                    .scrollIndicators(.never)
                    .padding(.leading)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            self.isSelectMusic = true
                        }
                    }
//                    .onAppear {
//                        audioManger.startPlayer(track: "THE LOVE MASHUP 2023", isPreview: isPreview)
//                    }
                    
                    //MARK: - Your Favourit artits
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
                    
                    //MARK: - Made For You
                    HStack {
                        Text("Made For You")
                            .font(.festerFont(customFontName: .FesterTrialSemiBold, fontSize: 24))
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 30, leading: 20, bottom: 12, trailing: 20))
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(madePlayListVM.YourPlayListcollectionManger) { collection in
                                MadeForYoucollectionPlayListRectangle(img1: collection.img1, img2: collection.img2, img3: collection.img3, img4: collection.img4, title: collection.title, totalSong: collection.totalSong)
                            }
                            .padding(.horizontal, 5)
                        }
                    }
                    .scrollIndicators(.never)
                    .padding([.leading, .bottom])
                    
                    //MARK: - Tips to get started
                    HStack {
                        Text("Tips to get started")
                            .font(.festerFont(customFontName: .FesterTrialSemiBold, fontSize: 24))
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 12, trailing: 20))
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(tipsViewModel.TipsDisplayManger) { manger in
                                TipsRectangleView(color: manger.color, systemImg: manger.systemImg, textTitle: manger.title, description: manger.description, width: manger.width)
                            }
                        }
                    }
                    .scrollIndicators(.never)
                    .padding([.leading, .bottom])
                    
                    //MARK: - Discover
                    HStack {
                        Text("Discover")
                            .font(.festerFont(customFontName: .FesterTrialSemiBold, fontSize: 24))
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 12, trailing: 20))
                    
                    ScrollView(.vertical) {
                        VStack {
                            ForEach(discoverVM.discoverCollectionManger) { discover in
                                DiscoverView(img: discover.image, title: discover.title, subTitle: discover.subTitle, timimg: discover.timingSong)
                            }
                            .onTapGesture {
                                self.isSelectMusic.toggle()
                            }
                        }
                    }
                    .scrollIndicators(.never)
                    .padding(.bottom)
                }
                .scrollIndicators(.never)
            }
            VStack {
                Spacer()
                if isSelectMusic {
                    PlayView(fullMusicView: false)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(isPreview: true)
    }
}
