//
//  OTPTextFiled.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 06/03/23.
//

import SwiftUI

struct OTPTextFiled: View {
    
    @StateObject var otpVM = OTPViewModel()
    @State var isFocused = false
    @State private var otpText: String = ""
    
    let textBoxWidth = UIScreen.main.bounds.width / 8
    let textBoxHeight = UIScreen.main.bounds.width / 8
    let spaceBetweenBoxes: CGFloat = 10
    let paddingOfBox: CGFloat = 1
    var textFieldOriginalWidth: CGFloat {
        (textBoxWidth*6)+(spaceBetweenBoxes*3)+((paddingOfBox*2)*3)
    }
    
    var body: some View {
        VStack {
            ZStack {
                HStack (spacing: spaceBetweenBoxes){
                    otpText(text: otpVM.otp1)
                    otpText(text: otpVM.otp2)
                    otpText(text: otpVM.otp3)
                    otpText(text: otpVM.otp4)
                    otpText(text: otpVM.otp5)
                    otpText(text: otpVM.otp6)
                }
                TextField("", text: $otpVM.otpField)
                    .frame(width: isFocused ? 0 : textFieldOriginalWidth, height: textBoxHeight)
                    .disabled(otpVM.isTextFieldDisabled)
                    .textContentType(.oneTimeCode)
                    .foregroundColor(.clear)
                    .accentColor(.clear)
                    .background(Color.clear)
                    .keyboardType(.numberPad)
            }
        }
    }
    
    private func otpText(text: String) -> some View {
        return Text(text)
            .font(.title)
            .frame(width: textBoxWidth, height: textBoxHeight)
            .background(
                VStack{
                    Spacer()
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.gray)
                        .frame(height: 3)
                })
            .padding(paddingOfBox)
    }
}

struct OTPTextFiled_Previews: PreviewProvider {
    static var previews: some View {
        OTPTextFiled()
    }
}
