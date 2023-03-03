//
//  CustomPhoneNumberPad.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 03/03/23.
//

import SwiftUI

struct CustomPhoneNumberPad: View {
    var body: some View  {
        VStack {
            Grid(horizontalSpacing: 20, verticalSpacing: 15) {
                GridRow {
                    CustomPhoneNumberButton(text: "1")
                    CustomPhoneNumberButton(text: "2")
                    CustomPhoneNumberButton(text: "3")
                }
                GridRow {
                    CustomPhoneNumberButton(text: "4")
                    CustomPhoneNumberButton(text: "5")
                    CustomPhoneNumberButton(text: "6")
                }
                GridRow {
                    CustomPhoneNumberButton(text: "7")
                    CustomPhoneNumberButton(text: "8")
                    CustomPhoneNumberButton(text: "9")
                }
                GridRow {
                    CustomPhoneNumberButton(text: ".")
                    CustomPhoneNumberButton(text: "0")
                    CustomPhoneNumberButton(text: "Delete")
                }
            }
        }
    }
}

struct CustomPhoneNumberPad_Previews: PreviewProvider {
    static var previews: some View {
        CustomPhoneNumberPad()
    }
}

//MARK: - Custom Numbers...
struct CustomPhoneNumberButton: View {

    @State var text: String
    
    var body: some View {
        
        if text == "Delete" {
            Button {
                
            } label: {
                NumberPadrectangle()
                    .overlay {
                        Image(systemName: "delete.backward.fill")
                            .font(.festerFont(customFontName: .FesterBold, fontSize: 22))
                            .foregroundColor(.black)
                    }
            }
        } else {
            Button {
                
            } label: {
                NumberPadrectangle()
                    .overlay {
                        Text(text)
                            .font(.festerFont(customFontName: .FesterBold, fontSize: 22))
                            .foregroundColor(.black)
                    }
            }
            .disabled(text == ".")
        }
    }
}

//MARK: - Create custom number pad rectangle
struct NumberPadrectangle: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .frame(width: dynamicWidth/4, height: dynamicHeight/15)
    }
}
