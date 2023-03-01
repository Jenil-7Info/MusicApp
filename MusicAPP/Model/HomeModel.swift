//
//  HomeModel.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 23/02/23.
//

import Foundation
import SwiftUI

//MARK: - LastPlay Model
struct LastPlayCollectionModel: Hashable, Identifiable {
    var id: UUID = UUID()
    var img: String
    var name: String
    var des: String
    
    init(img: String, name: String, des: String) {
        self.img = img
        self.name = name
        self.des = des
    }
}

//MARK: - Artits Model
struct ArtistsCollectionModel: Hashable, Identifiable {
    var id: UUID = UUID()
    var img: String
    
    init(img: String) {
        self.img = img
    }
}

//MARK: - Made For You PlayList Model...
struct MadeForYouPlayListModel: Hashable, Identifiable {
    var id: UUID = UUID()
    var img1: String
    var img2: String
    var img3: String
    var img4: String
    var title: String
    var totalSong: String
    
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
    var id: UUID = UUID()
    var color: LinearGradient
    var systemImg: String
    var title: String
    var description: String
    var width: CGFloat
    
    init(color: LinearGradient ,systemImg: String, title: String, description: String, width: CGFloat) {
        self.color = color
        self.systemImg = systemImg
        self.title = title
        self.description = description
        self.width = width
    }
}

struct DiscoverCollectionModel: Hashable, Identifiable {
    var id: UUID = UUID()
    var image: String
    var title: String
    var subTitle: String
    var timingSong: String
    
    init(image: String, title: String, subTitle: String, timingSong: String) {
        self.image = image
        self.title = title
        self.subTitle = subTitle
        self.timingSong = timingSong
    }
}
