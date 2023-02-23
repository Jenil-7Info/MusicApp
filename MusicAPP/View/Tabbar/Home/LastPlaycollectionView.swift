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
            .frame(width: dynamicWidth/2.3, height: dynamicHeight/2.9)
            .overlay {
                VStack(alignment: .leading) {
                    Image(img)
                        .resizable()
                        .aspectRatio(1.2,contentMode: .fill)
                        .frame(width: dynamicWidth/2.3, height: dynamicHeight/6)
                        .cornerRadius(radius: 20, corners: [.topLeft, .topRight])
                        .padding(.bottom)
                    Text(title)
                        .foregroundColor(.white)
                        .font(.festerFont(customFontName: .FesterTrialSemiBold, fontSize: 20))
                        .padding(.leading, 5)
                    Text(des)
                        .lineLimit(2)
                        .foregroundColor(.white)
                        .padding(5)
                }
            }
    }
}

struct LastPlaycollectionView_Previews: PreviewProvider {
    static var previews: some View {
        LastPlaycollectionView(img: "", title: "Jenil", des: "askdnksndfknsdfnisndfjnsufsdjnfiuhsdfndsfdf")
    }
}
