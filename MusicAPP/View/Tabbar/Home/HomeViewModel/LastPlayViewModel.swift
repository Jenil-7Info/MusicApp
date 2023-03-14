//
//  LastPalyViewModel.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 23/02/23.
//

import Foundation


class LastPlayCollectionViewModel: ObservableObject {
    
    @Published var LastPlayCollectionManger: [LastPlayCollectionModel] = [
        LastPlayCollectionModel(title: "Love Mashup 2023", duration: 90, track: "THE LOVE MASHUP 2023", img: "Love Mashup", des: "THE LOVE MASHUP 2023 BEST MASHUP OF ARJIT SHIGH, JUBIN NATUALIYA #LOVE #LOVESONGS"),
        LastPlayCollectionModel(title: "Discover Weekly", duration: 70, track: "Albam", img: "Albam-2", des: "Your Weekly mixtape of fresh music. Enjoy the Music Play..."),
        LastPlayCollectionModel(title: "Party hits", duration: 60, track: "Albam", img: "Albam-3", des: "A mix of the biggest pop, dence and hip hop songs play..."),
        LastPlayCollectionModel(title: "Discover Weekly", duration: 30, track: "Albam", img: "Albam-1", des: "Your Weekly mixtape of fresh music. Enjoy the Music Play...")
    ]
}
