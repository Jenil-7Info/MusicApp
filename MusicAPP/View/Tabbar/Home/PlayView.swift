//
//  PlayView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 09/03/23.
//

import SwiftUI

struct PlayView: View {
    
//    @Binding var collection: LastPlayCollectionModel
    @State private var fullMusicView: Bool = false
    @AppStorage("isPlayMusic") var isPlay: Bool = false
    @State private var isPreview: Bool = false
    @StateObject var audioManger = AudioManger()
    @State private var value : CGFloat = 0
    @State private var isEditing: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var timer = Timer
        .TimerPublisher(interval: 1, runLoop: .main, mode: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            //MARK: - Full View
            if fullMusicView {
                VStack {
                    Image("Love Mashup")
                        .resizable()
                        .frame(width: dynamicWidth)
                        .scaledToFill()
                        .blur(radius: 40, opaque: true)
                        .ignoresSafeArea()
                        .overlay {
                            VStack {
                                HStack {
                                    Button {
                                        withAnimation(.spring()) {
                                            self.fullMusicView.toggle()
                                        }
                                    } label: {
                                        Image(systemName: "chevron.down")
                                            .font(.system(size: 20))
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                    
                                    Spacer()
                                    
                                    Text("Playlist with Pop Songs")
                                        .padding()
                                        .foregroundColor(.white)
                                        .bold()
                                    
                                    Spacer()
                                }
                                
                                Spacer()
                                
                                Image("Love Mashup")
                                    .resizable()
                                    .scaledToFit()
                                
                                //MARK: -  Music Title
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("Love Mashup 2023")
                                            .font(.title2)
                                            .bold()
                                            .padding(.vertical, 2)
                                            .foregroundColor(.white)
                                        
                                        Text("Arjit shigh")
                                            .font(.body)
                                            .padding(.vertical, 2)
                                            .foregroundColor(.white)
                                    }
                                    .padding(.vertical)
                                    Spacer()
                                }
                                
                                if let player = audioManger.player {
                                    Slider(value: $value, in: 0...CGFloat(player.duration)){ editing in
                                        
                                        //this Bool use the song backward or forward in silder throw..
                                        self.isEditing = editing
                                        
                                        if !editing {
                                            player.currentTime = value
                                        }
                                    }
                                    .tint(.white)
                                    
                                    //MARK: - Timer...
                                    HStack {
                                        Text(DateComponentsFormatter.position.string(from: player.currentTime)!)
                                            .foregroundColor(.white)
                                        
                                        Spacer()
                                        
                                        Text(DateComponentsFormatter.position.string(from: player.duration)!)
                                            .foregroundColor(.white)
                                    }
                                }
                                
                                //MARK: -Slider and play buttons..
                                HStack {
                                    //NOTE: - Loop Button
                                    PlayViewButton(systemImage: "repeat", imgWidth: dynamicWidth/15, imgHeight: dynamicHeight/35, color: audioManger.isLooping ? .teal : .white) {
                                        //Play button Action
                                        audioManger.toggleLoop()
                                    }
                                    
                                    Spacer()
                                    
                                    //NOTE: - Backward Button
                                    PlayViewButton(systemImage: "backward.fill", imgWidth: dynamicWidth/15, imgHeight: dynamicHeight/35, color: .white) {
                                        //Play button Action
                                        audioManger.player?.currentTime -= 10
                                    }
                                    
                                    Spacer()
                                    
                                    //NOTE: - Play Button
                                    PlayViewButton(systemImage: isPlay ? "pause.circle.fill" : "play.circle.fill", imgWidth: dynamicWidth/7, imgHeight: dynamicHeight/15, color: .white) {
                                        self.isPlay.toggle()
                                        if isPlay {
                                            audioManger.startPlayer(track: "THE LOVE MASHUP 2023")
                                        } else {
                                            //Stop Methode...
                                            audioManger.stopPlayer()
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    //NOTE: - Backward Button
                                    PlayViewButton(systemImage: "forward.fill", imgWidth: dynamicWidth/15, imgHeight: dynamicHeight/35, color: .white) {
                                        //Backward button Action
                                        audioManger.player?.currentTime += 10
                                    }
                                    
                                    Spacer()
                                    
                                    //NOTE: - Stop Button
                                    PlayViewButton(systemImage: "square.fill", imgWidth: dynamicWidth/16, imgHeight: dynamicHeight/35, color: .white) {
                                        //Stop Button Action
                                        self.isPlay = false
                                        withAnimation {
                                            self.fullMusicView.toggle()
                                        }
                                        audioManger.stopPlayer()
                                    }
                                }
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                }
                .onReceive(timer) { _ in
                    guard let player = audioManger.player, !isEditing else {return}
                    value = player.currentTime
                }
            }
            //MARK: - Small View
            else {
                VStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: dynamicHeight/11)
                        .foregroundColor(Color(UIColor.systemGray3))
                        .overlay {
                            HStack {
                                Image("Love Mashup")
                                    .resizable()
                                    .aspectRatio(1.4, contentMode: .fit)
                                    .frame(width: dynamicWidth/6.5, height: dynamicHeight/15)
                                
                                VStack(alignment: .leading) {
                                    Text("Love Mashup")
                                        .foregroundColor(.white)
                                        .font(.festerFont(customFontName: .FesterBold, fontSize: 15))
                                    Text("Arjit shigh")
                                        .foregroundColor(.white)
                                        .font(.festerFont(customFontName: .FesterMedium, fontSize: 15))
                                }
                                .padding(.leading, 5)
                                
                                Spacer()
                                
                                //NOTE: - Backward Button
                                PlayViewButton(systemImage: "backward.fill", imgWidth: dynamicWidth/14, imgHeight: dynamicHeight/33, color: .white) {
                                    //Play button Action
                                    audioManger.player?.currentTime -= 10
                                }
                                
                                //NOTE: - Play Button
                                PlayViewButton(systemImage: isPlay ? "pause.fill" : "play.fill", imgWidth: dynamicWidth/22, imgHeight: dynamicHeight/32, color: .white) {
                                    self.isPlay.toggle()
                                    
                                    if isPlay {
                                        audioManger.startPlayer(track: "THE LOVE MASHUP 2023", isPreview: isPreview)
                                    } else {
                                        //Stop Methode...
                                        audioManger.stopPlayer()
                                    }
                                }
                                .padding(.horizontal)
                                
                                //NOTE: - Backward Button
                                PlayViewButton(systemImage: "forward.fill", imgWidth: dynamicWidth/14, imgHeight: dynamicHeight/33, color: .white) {
                                    //Play button Action
                                    audioManger.player?.currentTime += 10
                                }
                            }
                            .padding(.horizontal)
                        }
                        .onTapGesture {
                            withAnimation(.spring()) {
                                self.fullMusicView.toggle()
                            }
                        }
                }
            }
        }
        .onAppear {
            isPlay = false
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}

struct PlayViewButton: View {
    var systemImage: String
    var imgWidth: CGFloat
    var imgHeight: CGFloat
    var color: Color
    var action : () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemImage)
                .resizable()
                .frame(width: imgWidth, height: imgHeight)
                .foregroundColor(color)
        }
    }
}
