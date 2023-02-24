//
//  TipsViewModel.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 24/02/23.
//

import Foundation

class TipsViewModel: ObservableObject {
    @Published var TipsDisplayManger: [TipsDisplayModel] = [
        TipsDisplayModel(color: GradientColors.orangeGradient, systemImg: "mic.fill", title: "Never miss a song", description: "Find SongCatgory on your Search tab", width: 20),
        TipsDisplayModel(color: GradientColors.pitchGradient, systemImg: "paperplane.circle", title: "Discover podcasts", description: "All you need to grow or get enteraried", width: 30)
    ]
}
