//
//  AudioManger.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 14/03/23.
//

import Foundation
import SwiftUI
import AVKit

class AudioManger: ObservableObject {
    @Published var isPlaying: Bool = false
    var player : AVAudioPlayer?
    
    func startPlayer(track: String, isPreview: Bool = false) {
        guard let url = Bundle.main.url(forResource: track, withExtension: "mp3") else {
            debugPrint("Error:- URL IS MISSING!!!")
            return
        }
        
        do {
            //it's not alow to recoding, screen recorading...
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url)
            
            if isPreview {
                player?.prepareToPlay()
            } else {
                player?.play()
            }
        }
        catch {
            debugPrint("ERROR:- \(error.localizedDescription)")
        }
    }
    
    
    func stopPlayer() {
        player?.stop()
    }
}
