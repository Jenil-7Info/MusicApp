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
    @StateObject var otpVM = OTPViewModel()
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
                
                //MARK: - OTP Textfiled View
                OTPTextFiled()
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
               //Enter OTP verification code...
            } label: {
                Text("Submit")
                    .font(.festerFont(customFontName: .FesterBold, fontSize: 16))
                    .foregroundColor(.white)
                    .frame(width: dynamicWidth-(dynamicWidth*0.19), height: 25)
            }
            .padding()
            .background {
                Capsule()
                    //.fill(phoneVerifiyVM.code.count != 6 ? GradientColors.grayGradient : GradientColors.orangeGradient)
                    .fill(GradientColors.orangeGradient)
            }
            //.disabled(phoneVerifiyVM.code.count != 6)
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
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView()
    }
}
