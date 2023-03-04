//
//  OTPView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 03/03/23.
//

import SwiftUI
import Combine

struct OTPView: View {
    
    @StateObject var phoneVerifiyVM = PhoneVerificationViewModel()
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            
            //MARK: - Heading Of application
            ApplicationTitle()
                .padding(.top, 50)
            
            VStack(alignment: .leading) {
                
                //OTP text
                Text("Send OTP Code \(phoneVerifiyVM.phone)")
                    .font(.festerFont(customFontName: .FesterMedium, fontSize: 16))
                    .foregroundColor(.white)
                    .padding([.top, .horizontal],30)
                
                //MARK: - Enter here...
                HStack {
                    ForEach(0..<6, id: \.self) { index in
                        CodeView(text: getCodeAtIndex(index: index))
                    }
                }
                .padding(30)
            }
            
            HStack {
                Text("Didn't receive code?")
                    .foregroundColor(.gray)
                    .font(.festerFont(customFontName: .FesterMedium, fontSize: 16))
                    .padding(.vertical, 20)
                
                Button {
                    // Phone Verfiy sendCode Function...
                    
                } label: {
                    Text("Request Agian")
                        .foregroundColor(.white)
                        .font(.festerFont(customFontName: .FesterBold, fontSize: 18))
                }
            }
            .padding(.bottom, 20)
            
            //MARK: - Submit button
            Button {
               
            } label: {
                Text("Submit")
                    .font(.festerFont(customFontName: .FesterBold, fontSize: 16))
                    .foregroundColor(.white)
                    .frame(width: dynamicWidth-(dynamicWidth*0.19), height: 25)
            }
            .padding()
            .background {
                Capsule()
                    .fill(phoneVerifiyVM.code.count != 6 ? GradientColors.grayGradient : GradientColors.orangeGradient)
            }
            .disabled(phoneVerifiyVM.code.count != 6)
            .navigationDestination(isPresented: $phoneVerifiyVM.isVerifiy) {
                MusicRootView()
                    .navigationBarBackButtonHidden(true)
            }
            .alert("Alert", isPresented: $phoneVerifiyVM.isAlert) {
                Button {
                    dismiss.callAsFunction()
                } label: {
                    Text("OK")
                }
            } message: {
                Text(phoneVerifiyVM.errMessage)
            }
            Spacer()
        }
    }
    
    func getCodeAtIndex(index: Int) -> String {
        if phoneVerifiyVM.code.count > index {
            let start = phoneVerifiyVM.code.startIndex
            let current = phoneVerifiyVM.code.index(start, offsetBy: index)
            return String(phoneVerifiyVM.code[current])
        }
        return ""
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView12()
    }
}

struct CodeView: View {
    
    @State var text: String
    
    var body: some View {
        VStack {
            TextField("0", text: $text)
                .keyboardType(.numberPad)
                .onReceive(Just(text)) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.text = filtered
                    }
                }
                .multilineTextAlignment(.center)
                .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
                .foregroundColor(.white)
                .disabled(text.count == 1)
            
            Capsule()
                .frame(height: 4)
                .foregroundColor(.gray)
        }
    }
    
    
}


struct ContentView12: View {
    
      @StateObject var OtpVM = OTPViewModel()
      @State var isFocused = false
      
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
                          otpText(text: OtpVM.otp1)
                          otpText(text: OtpVM.otp2)
                          otpText(text: OtpVM.otp3)
                          otpText(text: OtpVM.otp4)
                          otpText(text: OtpVM.otp5)
                          otpText(text: OtpVM.otp6)
                      }
                      
                      TextField("", text: $OtpVM.otpField)
                      .frame(width: isFocused ? 0 : textFieldOriginalWidth, height: textBoxHeight)
                      .disabled(OtpVM.isTextFieldDisabled)
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

class OTPViewModel: ObservableObject {
    
    @Published var otpField = "" {
        didSet {
            guard otpField.count <= 6,
                  otpField.first?.isNumber ?? true else {
                otpField = oldValue
                return
            }
        }
    }
    
    @Published var isTextFieldDisabled = false
    
    var otp1: String {
        guard otpField.count >= 1 else {
            return ""
        }
        return String(Array(otpField)[0])
    }
    var otp2: String {
        guard otpField.count >= 2 else {
            return ""
        }
        return String(Array(otpField)[1])
    }
    var otp3: String {
        guard otpField.count >= 3 else {
            return ""
        }
        return String(Array(otpField)[2])
    }
    var otp4: String {
        guard otpField.count >= 4 else {
            return ""
        }
        return String(Array(otpField)[3])
    }
    
    var otp5: String {
        guard otpField.count >= 5 else {
            return ""
        }
        return String(Array(otpField)[4])
    }
    
    var otp6: String {
        guard otpField.count >= 6 else {
            return ""
        }
        return String(Array(otpField)[5])
    }
}
