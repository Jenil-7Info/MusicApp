//
//  OrangeBorderTextFiledView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 10/03/23.
//

import SwiftUI

struct OrangeBorderTextFiledView: View {
    
    @State var textString: String
    @Binding var text: String
    
    var body: some View {
        TextField(textString, text: $text)
            .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
            .foregroundColor(.white)
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(textString == "Email" ? .never : .words)
            .padding()
            .background {
                validationTextFiled(text, isEmail: textString == "Email", bgColorFloat: 0.48)
            }
            .padding(.horizontal, 20)
    }
    
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
}
