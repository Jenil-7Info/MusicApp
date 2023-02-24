//
//  MadeForYoucollectionPlayListRectangle.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 24/02/23.
//
import SwiftUI

struct MadeForYoucollectionPlayListRectangle: View {
    
    @State var img1: String
    @State var img2: String
    @State var img3: String
    @State var img4: String
    @State var title: String
    @State var totalSong: String
    
    var body: some View {
        
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(img1)
                    .resizable()
                Image(img2)
                    .resizable()
            }
            HStack(spacing: 0) {
                Image(img3)
                    .resizable()
                Image(img4)
                    .resizable()
            }
        }
        .frame(width: dynamicWidth/2.5, height: dynamicHeight/4)
        .cornerRadius(radius: 15, corners: .allCorners)
        .overlay {
            
            Color.black
                .opacity(0.4)
                .cornerRadius(radius: 15, corners: .allCorners)
            
            VStack(spacing: 5) {
                
                Spacer()
                
                Text(title)
                    .font(.festerFont(customFontName: .FesterBold, fontSize: 20))
                    .foregroundColor(.white)
                
                HStack(spacing: 3) {
                    Image(systemName: "music.note")
                        .renderingMode(.template)
                        .foregroundColor(.white)
                    Text(totalSong)
                        .font(.festerFont(customFontName: .FesterBold, fontSize: 14))
                        .foregroundColor(.white)
                    Text("Tracker")
                        .font(.festerFont(customFontName: .FesterBold, fontSize: 14))
                        .foregroundColor(.white)
                }
                .padding(.bottom)
            }
        }
    }
}

struct MadeForYoucollectionPlayListRectangle_Previews: PreviewProvider {
    static var previews: some View {
        MadeForYoucollectionPlayListRectangle(img1: "artice-5", img2: "artice-2", img3: "artice-4", img4: "artice-1", title: "Pop", totalSong: "3002")
    }
}
