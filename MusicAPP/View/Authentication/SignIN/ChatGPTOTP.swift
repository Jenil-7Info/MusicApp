//
//  ChatGPTOTP.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 03/03/23.
//

import SwiftUI

struct MyView: View {
    @State var otp = "2"
    
    var body: some View {
        OTPTextField(otp: $otp)
    }
}


struct ChatGPTOTP_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
        //OTPScreen()
    }
}

import SwiftUI

struct OTPTextField: View {
    @Binding var otp: String
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<6) { index in
                CircleTextField(text: $otp, index: index)
            }
        }
    }
}

struct CircleTextField: View {
    @Binding var text: String
    let index: Int
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray, lineWidth: 2)
                .frame(width: 40, height: 40)
            Text(String(text.prefix(1)))
                .foregroundColor(.black)
                .font(.system(size: 24, weight: .bold))
        }
        .padding(.horizontal, 4)
        .onTapGesture {
            // Set the focus to the text field when tapped
            DispatchQueue.main.async {
                UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
            }
        }
        .onChange(of: text) { newValue in
            // Move focus to the next text field when a digit is entered
            if text.count == 1 {
                if index < 5 {
                    DispatchQueue.main.async {
                        UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
                    }
                }
            }
        }
    }
}


//struct CircleTextField: View {
//    @Binding var text: String
//    let index: Int
//
//    var body: some View {
//        ZStack {
//            Circle()
//                .stroke(Color.gray, lineWidth: 2)
//                .frame(width: 40, height: 40)
//            Text(String(text.prefix(1)))
//                .foregroundColor(.white)
//                .font(.system(size: 24, weight: .bold))
//        }
//        .padding(.horizontal, 4)
//        .onTapGesture {
//            // Set the focus to the text field when tapped
//            DispatchQueue.main.async {
//                UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
//            }
//        }
//    }
//}
//
//
//
//struct OTPViews: View {
//    @State private var otp = ""
//    @State private var showAlert = false
//
//    var body: some View {
//        ZStack {
//            // Background color
//            Color("background")
//                .edgesIgnoringSafeArea(.all)
//
//            VStack {
//                Spacer()
//
//                Text("Enter OTP")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                    .padding()
//
//                HStack(spacing: 10) {
//                    ForEach(0..<6, id: \.self) { index in
//                        DigitView(value: otp.digit(at: index))
//                    }
//                }
//                .padding()
//
//                VStack(spacing: 20) {
//                    // Textfield for entering OTP
//                    TextField("", text: $otp)
//                        .foregroundColor(.white)
//                        .font(.largeTitle)
//                        .padding(.horizontal, 30)
//                        .keyboardType(.numberPad)
//                        .background(Color.black.opacity(0.4))
//                        .clipShape(Capsule())
//
//                    // Button for verifying OTP
//                    Button(action: {
//                        // Verify OTP
//                        if otp.count == 6 {
//                            // Code for verifying OTP
//                            showAlert = true
//                        }
//                    }) {
//                        Text("Verify OTP")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .padding()
//                            .frame(width: 220, height: 60)
//                            .background(Color.green)
//                            .cornerRadius(30)
//                    }
//                }
//                .padding()
//
//                Spacer()
//            }
//            .alert(isPresented: $showAlert) {
//                Alert(title: Text("Success"), message: Text("OTP verification successful"), dismissButton: .default(Text("OK")))
//            }
//        }
//    }
//}
//
//struct DigitView: View {
//    let value: Character?
//
//    var body: some View {
//        ZStack {
//            // Background color for digit
//            Circle()
//                .fill(Color.black.opacity(0.4))
//                .frame(width: 50, height: 50)
//
//            // Text for digit
//            Text(String(value ?? " "))
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .foregroundColor(.white)
//        }
//    }
//}
//
//extension String {
//    func digit(at index: Int) -> Character? {
//        guard index >= 0 && index < count else {
//            return nil
//        }
//        return self[self.index(self.startIndex, offsetBy: index)]
//    }
//}
