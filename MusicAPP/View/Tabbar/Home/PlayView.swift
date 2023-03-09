//
//  PlayView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 09/03/23.
//

import SwiftUI

struct PlayView: View {
    
    @State private var fullMusicView: Bool = false
    @State private var isPlay: Bool = false
    
    var body: some View {
        ZStack {
            if fullMusicView {
                FullViewMusic(fullMusicView: $fullMusicView)
            } else {
                VStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: dynamicHeight/10)
                        .foregroundColor(.red)
                        .overlay {
                            HStack {
                                Image("pop")
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fit)
                                    .frame(width: dynamicWidth/6.5, height: dynamicHeight/12)
                                    .cornerRadius(10)
                                
                                Spacer()
                                
                                //NOTE: - Backward Button
                                PlayViewButton(systemImage: "backward.fill", imgWidth: dynamicWidth/15, imgHeight: dynamicHeight/32, color: .white) {
                                    //Play button Action
                                }
                                
                                //NOTE: - Play Button
                                PlayViewButton(systemImage: isPlay ? "pause.fill" : "play.fill", imgWidth: dynamicWidth/22, imgHeight: dynamicHeight/32, color: .white) {
                                    self.isPlay.toggle()
                                }
                                .padding(.horizontal)
                                
                                //NOTE: - Backward Button
                                PlayViewButton(systemImage: "forward.fill", imgWidth: dynamicWidth/15, imgHeight: dynamicHeight/32, color: .white) {
                                    //Play button Action
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


struct FullViewMusic: View {
    
    @Binding var fullMusicView: Bool
    @State private var isPlay: Bool = false
    @State private var value : CGFloat = 0
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 0)
                .ignoresSafeArea()
                .foregroundColor(.red)
                .overlay {
                    VStack {
                        
                        Text("Playlist with Pop Songs")
                            .padding()
                        
                        Spacer()
                        
                        Image("pop")
                            .resizable()
                            .aspectRatio(1.3, contentMode: .fit)
                        
                        //MARK: -  Music Title
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Pop songs")
                                    .font(.title2)
                                    .bold()
                                    .padding(.vertical, 2)
                                
                                Text("Hanny sing, Mikka Sing")
                                    .font(.body)
                                    .padding(.vertical, 2)
                            }
                            .padding(.vertical)
                            Spacer()
                        }
                        
                        Slider(value: $value)
                            .tint(.white)
                        
                        //MARK: - Timer...
                        HStack {
                            Text("0:01")
                            Spacer()
                            Text("3:44")
                        }
                        
                        //MARK: -Slider and play buttons..
                        HStack {
                            
                            //NOTE: - Loop Button
                            PlayViewButton(systemImage: "repeat", imgWidth: dynamicWidth/15, imgHeight: dynamicHeight/35, color: .white) {
                                //Play button Action
                            }
                            
                            Spacer()
                            
                            //NOTE: - Backward Button
                            PlayViewButton(systemImage: "backward.fill", imgWidth: dynamicWidth/15, imgHeight: dynamicHeight/35, color: .white) {
                                //Play button Action
                            }
                            
                            Spacer()
                            
                            //NOTE: - Play Button
                            PlayViewButton(systemImage: isPlay ? "pause.circle.fill" : "play.circle.fill", imgWidth: dynamicWidth/7, imgHeight: dynamicHeight/15, color: .white) {
                                self.isPlay.toggle()
                            }
                            
                            Spacer()
                            
                            //NOTE: - Backward Button
                            PlayViewButton(systemImage: "forward.fill", imgWidth: dynamicWidth/15, imgHeight: dynamicHeight/35, color: .white) {
                                //Play button Action
                            }
                            
                            Spacer()
                            
                            //NOTE: - Backward Button
                            PlayViewButton(systemImage: "square.fill", imgWidth: dynamicWidth/16, imgHeight: dynamicHeight/35, color: .white) {
                                //Stop Button Action
                                
                                self.isPlay.toggle()
                            }
                        }
                        
                        Spacer()
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
