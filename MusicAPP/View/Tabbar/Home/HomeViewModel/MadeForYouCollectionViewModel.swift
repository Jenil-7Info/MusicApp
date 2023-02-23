//
//  MadeForYouCollectionViewModel.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 23/02/23.
//

import Foundation

class MadeForYouCollectionViewModel: ObservableObject {
    @Published var YourPlayListcollectionManger: [MadeForYouPlayListModel] = [
        MadeForYouPlayListModel(img: "hardRock", title: "Hard Rock", totalSong: "3006"),
        MadeForYouPlayListModel(img: "hip-hop", title: "Hip hop", totalSong: "10253"),
        MadeForYouPlayListModel(img: "pop", title: "Pop", totalSong: "5002"),
        MadeForYouPlayListModel(img: "classic", title: "Classic", totalSong: "4012")
    ]
}
