//
//  ProfileView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 22/02/23.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var name: String = "Jenil Rughani"
    @State private var value : CGFloat = 0.8
    @State private var isPresentChangeProfile: Bool = false
    @State private var isSetRandom: Bool = false
    @State private var isClearData: Bool = false
    @State private var isAlertLogout: Bool = false
    @AppStorage("email") var email: String = ""
    @StateObject var googleVM = GoogleAutheticationViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            //MARK: - Header...
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Text("Settings")
                    .font(.festerFont(customFontName: .FesterBold, fontSize: 25))
                    .bold()
                    .padding(.trailing)
                
                Spacer()
            }
           
            ScrollView {
                //MARK: - MainProfileView
                Button {
                    self.isPresentChangeProfile.toggle()
                } label: {
                    HStack {
                        Circle()
                            .fill(.orange)
                            .frame(width: 60, height: 60)
                            .overlay {
                                Text(name.first?.description ?? "Unkown")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .bold()
                            }
                        
                        VStack(alignment: .leading) {
                            Text(name)
                                .foregroundColor(.white)
                                .font(.festerFont(customFontName: .FesterMedium, fontSize: 20))
                            Text("View Profile")
                                .font(.body)
                                .foregroundColor(.white)
                        }
                        .padding()
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 10, height: 15)
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                .navigationDestination(isPresented: $isPresentChangeProfile) {
                    EmptyView()
                }
                
                //MARK: - Account
                VStack {
                    HStack {
                        Text("Account")
                            .font(.title2)
                            .foregroundColor(.white)
                            .bold()
                        Spacer()
                    }
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 3) {
                            Text("Email")
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding(.top)
                                
                            Text(email)
                                .foregroundColor(.white.opacity(0.8))
                                .font(.headline)
                        }
                        Spacer()
                    }
                }
                .padding(.vertical)
                
                //MARK: - Data Saver
                VStack {
                    HStack {
                        Text("Data Sever")
                            .font(.title2)
                            .bold()
                        Spacer()
                    }
                    
                    HStack {
                        Toggle(isOn: $isSetRandom) {
                            Text("Audio Quality")
                                .foregroundColor(.white)
                                .font(.title3)
                            
                            Text("Sets your audio quality to low (equivalent to 24bits/s) and disables artist canvases.")
                        }
                        
                        Spacer()
                    }
                }
                .padding(.vertical)
                
                //MARK: - Video Podcasts
                VStack {
                    HStack {
                        Text("Video Podcasts")
                            .font(.title2)
                            .bold()
                        Spacer()
                    }
                    
                    HStack {
                        Toggle(isOn: $isSetRandom) {
                            Text("Download audio only")
                                .font(.title3)
                            Text("Save Video podcasts as audio only.")
                        }
                    }
                    .padding(.vertical, 5)
                    
                    HStack {
                        Toggle(isOn: $isSetRandom) {
                            Text("Stream audio only")
                                .font(.title3)
                            Text("Play video podcasts as audio only when not on WiFi.")
                        }
                    }
                    
                    HStack(spacing: 10) {
                        Image(systemName: "i.circle")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .bold()
                        
                        Text("Note: video is not streamed when the spotify app is backgrounded.")
                            .foregroundColor(.white.opacity(0.8))
                        Spacer()
                    }
                    .padding(.vertical)
                }
                .padding(.vertical)
                
                //MARK: - Playback
                VStack {
                    HStack {
                        Text("Playback")
                            .font(.title2)
                            .bold()
                        Spacer()
                    }
                    .padding(.bottom)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Cressfade")
                                .font(.title3)
                                .bold()
                            
                            Text("Allow you to creoss between songs")
                                .foregroundColor(.white.opacity(0.8))
                        }
                        .padding(.top)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("Off")
                            .bold()
                        Slider(value: $value)
                            .tint(.orange)
                        Text("12 s")
                            .bold()
                    }
                    .padding(.vertical)
                    
                    Toggle(isOn: $isSetRandom) {
                        Text("Gapless")
                            .font(.title3)
                        Text("Allow gapless playback")
                            .foregroundColor(.white.opacity(0.8))
                    }
                    
                    Toggle(isOn: $isSetRandom) {
                        Text("Automix")
                            .font(.title3)
                        Text("allow seamless transitions between songs on select playlists.")
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(.vertical)
                    
                    Toggle(isOn: $isSetRandom) {
                        Text("Allow Explicit Content")
                            .font(.title3)
                        Text("Turn on to play explicit content Explicit content is labeled with 'E' tag")
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
                .padding(.vertical)
                
                //MARK: - Storage
                VStack {
                    HStack {
                        Text("Storage")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    
                    Capsule()
                        .fill(.blue)
                        .padding(.vertical)
                    
                    //NOTE: - blue
                    HStack {
                        Circle()
                            .fill(.blue)
                            .frame(width: 15, height: 15)
                        Text("Other apps")
                        
                        Spacer()
                        
                        Text("9.0 GB")
                    }
                    
                    //NOTE: - green
                    HStack {
                        Circle()
                            .fill(.green)
                            .frame(width: 15, height: 15)
                        Text("Downloads")
                        
                        Spacer()
                        
                        Text("30.0 MB")
                    }
                    
                    //NOTE: - lightgray
                    HStack {
                        Circle()
                            .fill(.white.opacity(0.8))
                            .frame(width: 15, height: 15)
                        Text("Cache")
                        
                        Spacer()
                        
                        Text("37.0 MB")
                    }
                    
                    //NOTE: - darkGray
                    HStack {
                        Circle()
                            .fill(.green)
                            .frame(width: 15, height: 15)
                        Text("Other apps")
                        
                        Spacer()
                        
                        Text("30.0 MB")
                    }
                 
                    //NOTE: - Free
                    HStack {
                        Circle()
                            .fill(.gray)
                            .frame(width: 15, height: 15)
                        
                        Text("Free")
                        
                        Spacer()
                        
                        Text("681.0 MB")
                    }
                    
                    //NOTE: - Clear cache
                    Button {
                        self.isClearData.toggle()
                    } label: {
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Clear cache")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                
                                Text("You can free up storage by clearing your caches. Your downloads won't be removed.")
                                    .foregroundColor(.white.opacity(0.8))
                                    .multilineTextAlignment(.leading)
                            }
                            
                            Spacer()
                        }
                    }
                    .alert("Alert", isPresented: $isClearData, actions: {
                        Text("OK")
                    }, message: {
                        Text("All Clear caches")
                    })
                    .padding(.top)
                    
                }
                
                //MARK: - About
                VStack {
                    HStack {
                        Text("About")
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                        Spacer()
                    }
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Version")
                                .font(.title3)
                                .bold()
                            Text("8.8.10.582")
                                .foregroundColor(.white.opacity( 0.8))
                        }
                        Spacer()
                    }
                    .padding(.vertical)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Privacy Policy")
                                .font(.title3)
                                .bold()
                            Text("Imaport for both of us.")
                                .foregroundColor(.white.opacity(0.8))
                        }
                        Spacer()
                    }
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Support")
                                .font(.title3)
                                .bold()
                            Text("Get help from us and the commuunity.")
                                .foregroundColor(.white.opacity(0.8))
                        }
                        Spacer()
                    }
                    .padding(.vertical)
                }
                .padding(.vertical)
                
                VStack {
                    HStack {
                        Text("Other")
                            .font(.title2)
                            .bold()
                        Spacer()
                    }
                    .padding(.bottom)
                    
                    //MARK: - Logout
                    Button {
                        self.isAlertLogout = true
                    } label: {
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Log out")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .bold()
                                Text("You are logged in as ").foregroundColor(.white) + Text(name)
                                    .foregroundColor(.white.opacity(0.87))
                            }
                            Spacer()
                        }
                    }
                    .alert("Alert", isPresented: $isAlertLogout) {
                        Button("Cancle", role: .cancel) {
                            
                        }
                        Button("Logout", role: .destructive) {
                            self.googleVM.signOut()
                        }
                    } message: {
                        Text("Are you sure you want logout?")
                    }
                }
                Spacer()
            }
            .padding(.vertical)
            .scrollIndicators(.never)
        }
        .padding(.horizontal, 20)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(GoogleAutheticationViewModel())
            .environmentObject(EmailAuthenticationViewModel())
    }
}
