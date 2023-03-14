//
//  HomeModel.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 23/02/23.
//

import Foundation
import SwiftUI
import AVKit

//MARK: - LastPlay Model
struct LastPlayCollectionModel: Hashable, Identifiable {
    
    let id: UUID = UUID()
    let title: String
    let duration: TimeInterval
    let track: String
    let img: String
    let des: String
    
    init(title: String, duration: TimeInterval, track: String, img: String, des: String) {
        self.title = title
        self.duration = duration
        self.track = track
        self.img = img
        self.des = des
    }
}

//MARK: - Artits Model
struct ArtistsCollectionModel: Hashable, Identifiable {
    let id: UUID = UUID()
    let img: String
    
    init(img: String) {
        self.img = img
    }
}

//MARK: - Made For You PlayList Model...
struct MadeForYouPlayListModel: Hashable, Identifiable {
    let id: UUID = UUID()
    let img1: String
    let img2: String
    let img3: String
    let img4: String
    let title: String
    let totalSong: String
    
    init(img1: String, img2: String, img3: String, img4: String, title: String, totalSong: String) {
        self.img1 = img1
        self.img2 = img2
        self.img3 = img3
        self.img4 = img4
        self.title = title
        self.totalSong = totalSong
    }
}

//MARK: - Tips Display Model...
struct TipsDisplayModel: Identifiable {
    let id: UUID = UUID()
    let color: LinearGradient
    let systemImg: String
    let title: String
    let description: String
    let width: CGFloat
    
    init(color: LinearGradient ,systemImg: String, title: String, description: String, width: CGFloat) {
        self.color = color
        self.systemImg = systemImg
        self.title = title
        self.description = description
        self.width = width
    }
}

struct DiscoverCollectionModel: Hashable, Identifiable {
    let id: UUID = UUID()
    let image: String
    let title: String
    let subTitle: String
    let timingSong: String
    
    init(image: String, title: String, subTitle: String, timingSong: String) {
        self.image = image
        self.title = title
        self.subTitle = subTitle
        self.timingSong = timingSong
    }
}
