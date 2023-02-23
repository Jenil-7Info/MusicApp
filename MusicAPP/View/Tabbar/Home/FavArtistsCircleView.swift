//
//  FavArtistsCircleView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 23/02/23.
//

import SwiftUI

struct FavArtistsCircleView: View {
    
    @State var img: String
    
    var body: some View {
        Image(img)
            .resizable()
            .scaledToFill()
            .frame(width: dynamicWidth/4, height: dynamicHeight/8)
            .clipShape(Circle())
    }
}

struct FavArtistsCircleView_Previews: PreviewProvider {
    static var previews: some View {
        FavArtistsCircleView(img: "")
    }
}
