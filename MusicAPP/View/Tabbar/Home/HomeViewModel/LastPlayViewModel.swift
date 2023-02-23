//
//  LastPalyViewModel.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 23/02/23.
//

import Foundation


class LastPlayCollectionViewModel: ObservableObject {
    
    @Published var LastPlayCollectionManger: [LastPlayCollectionModel] = [
        LastPlayCollectionModel(img: "Albam-2", name: "Discover Weekly", des: "Your Weekly mixtape of fresh music. Enjoy the Music Play..."),
        LastPlayCollectionModel(img: "Albam-3", name: "Party hits", des: "A mix of the biggest pop, dence and hip hop songs play..."),
        LastPlayCollectionModel(img: "Albam-1", name: "Discover Weekly", des: "Your Weekly mixtape of fresh music. Enjoy the Music Play..."),
    ]
}
