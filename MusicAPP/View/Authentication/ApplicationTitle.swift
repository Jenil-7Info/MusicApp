//
//  ApplicationTitle.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 02/03/23.
//

import Foundation
import SwiftUI

struct ApplicationTitle: View {
    var body: some View {
        Text("Music App")
            .font(.festerFont(customFontName: .FesterBold, fontSize: 50))
            .overlay {
                GradientColors.orangeGradient
                    .mask {
                        Text("Music App")
                            .font(.festerFont(customFontName: .FesterBold, fontSize: 50))
                    }
            }
    }
}
