//
//  LastPlaycollectionView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 23/02/23.
//

import SwiftUI

struct LastPlaycollectionView: View {
    
    @State var img: String
    @State var title: String
    @State var des: String
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 20)
            .fill(.gray.opacity(0.5))
            .frame(width: dynamicWidth/2.3, height: dynamicHeight/3.2)
            .overlay {
                VStack(alignment: .leading) {
                    Image(img)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: dynamicWidth/2.3, height: dynamicHeight/5.6)
                        .cornerRadius(radius: 20, corners: [.topLeft, .topRight])
                        .offset(y: -10)
                        
                    Text(title)
                        .foregroundColor(.white)
                        .font(.festerFont(customFontName: .FesterTrialSemiBold, fontSize: 20))
                        .padding(.horizontal, 8)
                        .padding(.bottom, 2)
                       
                    Text(des)
                        .lineLimit(2)
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                }
            }
    }
}

struct LastPlaycollectionView_Previews: PreviewProvider {
    static var previews: some View {
        LastPlaycollectionView(img: "pop", title: "Jenil", des: "Marshel Songs")
          //  .preferredColorScheme(.dark)
    }
}
