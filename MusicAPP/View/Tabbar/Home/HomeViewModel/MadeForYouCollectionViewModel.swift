//
//  MadeForYouCollectionViewModel.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 23/02/23.
//

import Foundation

class MadeForYouCollectionViewModel: ObservableObject {
    @Published var YourPlayListcollectionManger: [MadeForYouPlayListModel] = [
        MadeForYouPlayListModel(img1: "hardRock",img2: "artice-1", img3: "artice-4", img4: "pop" , title: "Hard Rock", totalSong: "3006"),
        MadeForYouPlayListModel(img1: "hip-hop", img2: "artice-5", img3: "pop", img4: "artice-4" ,title: "Hip hop", totalSong: "10253"),
        MadeForYouPlayListModel(img1: "pop", img2: "artice-5", img3: "artice-1", img4: "artice-2",title: "Pop", totalSong: "5002"),
        MadeForYouPlayListModel(img1: "classic", img2: "artice-1", img3: "hardRock", img4: "hip-hop" ,title: "Classic", totalSong: "4012")
    ]
}
