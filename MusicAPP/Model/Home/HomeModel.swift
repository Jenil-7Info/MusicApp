//
//  HomeModel.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 23/02/23.
//

import Foundation

//MARK: - LastPlay Model
struct LastPlayCollectionModel: Identifiable {
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
