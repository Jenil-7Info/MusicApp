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
    var player : AVAudioPlayer?
    @Published private(set) var isLooping: Bool = false
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
    
    func playPlayer() {
        player?.play()
    }
    
    func pausePlayer() {
        player?.pause()
    }
    
    func stopPlayer() {
        player?.stop()
    }
    
    func toggleLoop() {
        guard let player = player else { return }
        
        player.numberOfLoops = player.numberOfLoops == 0 ? -1 : 0
        isLooping = player.numberOfLoops != 0
    }
}
