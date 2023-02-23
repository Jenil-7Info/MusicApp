//
//  YouFavArtistViewModel.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 23/02/23.
//

import Foundation

class YourFavArtitsCollectionViewModel: ObservableObject {
    @Published var ArtitsImageCollectionManger : [ArtistsCollectionModel] = [
        ArtistsCollectionModel(img: "artice-1"),
        ArtistsCollectionModel(img: "artice-2"),
        ArtistsCollectionModel(img: "artice-3"),
        ArtistsCollectionModel(img: "artice-4"),
        ArtistsCollectionModel(img: "artice-5")
    ]
}
