//
//  DiscoverView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 24/02/23.
//

import SwiftUI

struct DiscoverView: View {
    
    @State var img: String
    @State var title: String
    @State var subTitle: String
    @State var timimg: String
    
    var body: some View {
        HStack {
            Image(img)
                .resizable()
                .scaledToFill()
                .frame(width: dynamicWidth/5, height: dynamicHeight/9)
                .cornerRadius(radius: 15, corners: .allCorners)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.title3)
                    .bold()
                Text(subTitle)
            }
            .padding(.leading, 8)
            
            Spacer()
            
            Text(timimg)
                .font(.callout)
                .foregroundColor(.gray)
        }
        .padding()
    }
}


struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView(img: "pop", title: "System of A Down", subTitle: "Chop Suey!", timimg: "5:32")
    }
}
