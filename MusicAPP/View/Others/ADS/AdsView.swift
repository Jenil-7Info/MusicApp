//
//  AdsView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 15/03/23.
//

import SwiftUI
import AVKit

struct AdsView: View {
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
            VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "demo1", withExtension: "mp4")!))//demo1.mp4
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
            Spacer()
        }
    }
}

struct AdsView_Previews: PreviewProvider {
    static var previews: some View {
        AdsView()
    }
}
