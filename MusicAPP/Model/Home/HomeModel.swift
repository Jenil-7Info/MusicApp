//
//  HomeModel.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 23/02/23.
//

import Foundation

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
    var img: String
    var title: String
    var totalSong: String
    
    init(img: String, title: String, totalSong: String) {
        self.img = img
        self.title = title
        self.totalSong = totalSong
    }
}
