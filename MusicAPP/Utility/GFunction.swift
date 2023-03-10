//
//  GFunction.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 10/03/23.
//

import Foundation
import SwiftUI

//MARK: - CustomValidation TextFiled...
func validationTextFiled(_ txtFiledName: String, isEmail: Bool = false, bgColorFloat: CGFloat) -> some View {
    ZStack {
        if isEmail {
            RoundedRectangle(cornerRadius: 15)
                .stroke(!txtFiledName.isEmpty && txtFiledName.contains{$0 == "@"} && txtFiledName.contains{ $0 == "." } ? .orange : .clear ,
                        lineWidth:!txtFiledName.isEmpty && txtFiledName.contains{$0 == "@"} && txtFiledName.contains{ $0 == "." } ?  3 : 0)
            RoundedRectangle(cornerRadius: 15)
                .fill(.white.opacity(bgColorFloat))
        } else {
            RoundedRectangle(cornerRadius: 15)
                .stroke(!txtFiledName.isEmpty ? .orange : .clear , lineWidth:!txtFiledName.isEmpty ?  3 : 0)
            RoundedRectangle(cornerRadius: 15)
                .fill(.white.opacity(bgColorFloat))
        }
    }
}
