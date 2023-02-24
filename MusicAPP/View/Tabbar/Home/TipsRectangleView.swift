//
//  TipsRectangleView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 24/02/23.
//

import SwiftUI

struct TipsRectangleView: View {
    
    @State var color: LinearGradient
    @State var systemImg: String
    @State var textTitle: String
    @State var description: String
    @State var width: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(color.opacity(0.9))
            .frame(width: dynamicWidth/1.3, height: dynamicHeight/7.5)
            .overlay {
                HStack(spacing: 20) {
                    Image(systemName: systemImg)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .frame(width: width, height: 30)
                        
                    VStack(alignment: .leading, spacing: 5) {
                        Text(textTitle)
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(description)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal)
            }
    }
}

struct TipsRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        TipsRectangleView(color: GradientColors.orangeGradient, systemImg: "mic.fill", textTitle: "never miss the song", description: "asdbfjhsbfjbsdkbasbasdbfjhsbfjbsdkbasbasdbfjhsbfjbsdkbasbasdbfjhsbfjbsdkbasbasdbfjhsbfjbsdkbasbasdbfjhsbfjbsdkbasbasdbfjhsbfjbsdkbasbasdbfjhsbfjbsdkbasbasdbfjhsbfjbsdkbasbasdbfjhsbfjbsdkbasbasdbfjhsbfjbsdkbasbasdbfjhsbfjbsdkbasbasdbfjhsbfjbsdkbasbasdbfjhsbfjbsdkbasbasdbfjhsbfjbsdkbasb", width: 20)
    }
}
