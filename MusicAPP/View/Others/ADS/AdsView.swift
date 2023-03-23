//
//  AdsView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 15/03/23.
//

import SwiftUI
import AVKit

struct AdsView: View {
    
    @State private var player = AVPlayer(url: Bundle.main.url(forResource: "demo1", withExtension: "mp4")!)

    @State private var isPlayer: Bool = false
    @State var videoFinished = false
    
    var body: some View {
        VStack {
            ApplicationTitle()
                .padding()
            
            //MARK: - Ads Title
            HStack {
                VStack(alignment: .leading) {
                    Text("Ads")
                        .font(.title)
                        .bold()
                        .padding(.vertical)
                    
                    Text("Presents...")
                        .bold()
                        .font(.body)
                        .foregroundColor(.yellow)
                    
                    Text("Video player demo with Big Buck Bunny")
                        .font(.body)
                        .bold()
                }
                Spacer()
            }
            .padding(.horizontal)
            
            //MARK: - using URL VideoPlayer
          //  VideoPlayer(player: AVPlayer(url: URL(string: "https://bit.ly/swswift")!))
            
            //MARK: - using Bundle URL VideoPlayer
            
            VideoPlayer(player: player)//demo1.mp4
                .unredacted()
                .overlay {
                    VStack {
                        Spacer()
                        Text("Wix Ads")
                            .padding()
                            .opacity(0.3)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                }
                .onReceive(NotificationCenter.default.publisher(for: .AVPlayerItemDidPlayToEndTime)) { _ in
                    withAnimation(.spring()) {
                        videoFinished = true
                    }
                }
            Spacer()
        }
        .overlay {
            if videoFinished {
                PopBoxview()
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                            withAnimation(.spring()) {
                                self.videoFinished = false
                            }
                        }
                    }
            }
        }
    }
}

struct AdsView_Previews: PreviewProvider {
    static var previews: some View {
       AdsView()
       // PopBoxview()
    }
}

struct PopBoxview: View{
    var body: some View {
        RoundedRectangle(cornerRadius: 40)
            .fill(.pink.opacity(0.6))
            .blur(radius: 0)
            .frame(width: dynamicWidth/1.6, height: dynamicHeight/3)
            .overlay {
//                Image("artice-5")
//                    .opacity(0.15)
//                    .blur(radius: 6)
                
                VStack {
                    Text("Nice you have and burn the calery")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text("🔥")
                        .font(.system(size: 25))
                        .padding()
                    
                    Text("378 Kcal")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom)
                }
            }
    }
}
