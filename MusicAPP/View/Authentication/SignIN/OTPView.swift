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
        NavigationStack {
            
            ZStack {
                
                Image("OTPScreen_60%")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                //MARK: - Back button
                VStack {
                    HStack {
                        Button {
                            dismiss.callAsFunction()
                        } label: {
                            Image(systemName: "arrow.left")
                                .resizable()
                                .frame(width: 25, height: 20)
                                .foregroundColor(.white)
                            Text("Back")
                                .font(.body)
                                .bold()
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 15, leading: 30, bottom: 0, trailing: 30))
                    Spacer()
                }
                
                //MARK: - Middle View
                VStack {
                    
                    //MARK: - Verfication Text...
                    VStack {
                        
                        ApplicationTitle()
                            .padding()
                        
                        HStack {
                            Text("Enter 6 digit verfication code")
                                .font(.system(size: 18))
                                .bold()
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.top)
                        .padding(.horizontal, 40)
                        
                        
                        //MARK: - OTP TextFiled
                        HStack {
                            if phoneVerifiyVM.otpText.count == 6 {
                                Text("✅")
                            }
                              
                            TextField("Enter OTP Code", text: $phoneVerifiyVM.otpText)
                                .textContentType(.telephoneNumber)
                                .padding()
                                .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
                                .foregroundColor(.white)
                                .autocorrectionDisabled(true)
                                .multilineTextAlignment(.center)
                                .textContentType(.password)
                                .keyboardType(.numberPad)
                                .textInputAutocapitalization(.never)
                                .disabled(phoneVerifiyVM.otpText.count == 6)
                            
                            Button {
                                self.phoneVerifiyVM.otpText = ""
                            } label: {
                                Image(systemName: phoneVerifiyVM.otpText.isEmpty ? "" : "multiply.circle.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.horizontal)
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(!phoneVerifiyVM.otpText.isEmpty ? phoneVerifiyVM.otpText.count == 6 ? .white.opacity(0.6) : .yellow : .clear, lineWidth: !phoneVerifiyVM.otpText.isEmpty ?  3 : 0)
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.white.opacity(0.3))
                        }
                        .padding([.horizontal, .bottom],30)
                    }
                    
                    //MARK: - Receive code
                    HStack {
                        Text("Didn't receive code?")
                            .foregroundColor(.white)
                            .font(.festerFont(customFontName: .FesterMedium, fontSize: 16))
                            .padding(.vertical, 20)
                        
                        Button {
                            //Clear All Otp Digit...
                            self.phoneVerifiyVM.otpText = ""
                            // Phone Verfiy sendCode Function...
                            phoneVerifiyVM.resendOTPCode()
                        } label: {
                            Text("Request Agian")
                                .foregroundColor(.white)
                                .font(.festerFont(customFontName: .FesterBold, fontSize: 18))
                        }
                    }
                    
                    //MARK: - Submit button
                    Button {
                        phoneVerifiyVM.otpVerification()
                    } label: {
                        Text("Submit")
                            .font(.festerFont(customFontName: .FesterBold, fontSize: 16))
                            .foregroundColor(.white)
                            .frame(width: dynamicWidth-(dynamicWidth*0.19), height: 25)
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 15)
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
                }
            }
        }
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView()
    }
}
