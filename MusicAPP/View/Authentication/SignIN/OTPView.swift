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
    @State private var otpCode: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                
                Spacer()
                
                ApplicationTitle()
                    .padding(30)
                
                VStack {
                    
                    //OTP text
                    Text("Verification")
                        .font(.festerFont(customFontName: .FesterBold, fontSize: 28))
                        .foregroundColor(.white)
                        .padding(.vertical)
                    
                    Text("We have sent OTP to your e-mail, \nplease type code in here")
                        .font(.festerFont(customFontName: .FesterMedium, fontSize: 16))
                        .foregroundColor(.white)
                        .padding(.bottom)
                        .multilineTextAlignment(.center)
                    
                    //MARK: - OTP Textfiled View
                    /*
                     Note:-
                     This Textfiled supported Only one Text....
                     //OTPTextFiled()
                     */
                    HStack {
                        
                        if otpCode.count == 6 {
                            Text("✅")
                        }
                        
                        TextField("Enter OTP Number", text: $otpCode)
                            .textContentType(.telephoneNumber)
                            .padding()
                            .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
                            .foregroundColor(.white)
                            .autocorrectionDisabled(true)
                            .textContentType(.password)
                            .keyboardType(.numberPad)
                            .textInputAutocapitalization(.never)
                            .disabled(otpCode.count == 6)
                        
                        Button {
                            self.otpCode = ""
                        } label: {
                            Image(systemName: "multiply.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal)
                    .background {
                        Capsule()
                            .stroke(!otpCode.isEmpty ? otpCode.count == 6 ? .white.opacity(0.6) : .yellow : .clear, lineWidth: !otpCode.isEmpty ?  3 : 0)
                        Capsule()
                            .fill(.white.opacity(0.3))
                    }
                    .padding([.horizontal, .bottom],30)
                }
                
                HStack {
                    Text("Didn't receive code?")
                        .foregroundColor(.gray)
                        .font(.festerFont(customFontName: .FesterMedium, fontSize: 16))
                        .padding(.vertical, 20)
                    
                    Button {
                        //Clear All Otp Digit...
                        self.otpCode = ""
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
                    phoneVerifiyVM.otpVerification(getOTP: otpCode)
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
                .navigationDestination(isPresented: $phoneVerifiyVM.isVerifiy) {
                    MusicTabbarView()
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
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView()
    }
}
