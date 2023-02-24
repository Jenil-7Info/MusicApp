//
//  DiscoverViewmodel.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 24/02/23.
//

import SwiftUI

class DiscoverViewModel: ObservableObject {
    @Published var discoverCollectionManger: [DiscoverCollectionModel] = [
        DiscoverCollectionModel(image: "artice-1", title: "System Of A Down", subTitle: "Choip Suey!", timingSong: "5:32"),
        DiscoverCollectionModel(image: "artice-2", title: "Coolie", subTitle: "Gangstar's Parodise", timingSong: "3:21"),
        DiscoverCollectionModel(image: "artice-3", title: "Joji", subTitle: "Slow dancing", timingSong: "5:32"),
        DiscoverCollectionModel(image: "pop", title: "Survivor", subTitle: "Choip Suey!", timingSong: "4:21"),
        DiscoverCollectionModel(image: "artice-5", title: "Michel Jackson", subTitle: "Beat it!", timingSong: "5:32"),
    ]
}
