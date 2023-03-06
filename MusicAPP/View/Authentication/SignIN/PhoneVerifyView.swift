//
//  PhoneVerifyView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 02/03/23.
//

import SwiftUI

struct PhoneVerifyView: View {
    
    @StateObject var phoneVerifiyVM = PhoneVerificationViewModel()
    @State private var phoneNumber: String = ""
    @State private var isPresentOTPScreen: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                
                Spacer()
                
                //MARK: - Heading Of application
                ApplicationTitle()
                    .padding(.top, 50)
                
                VStack(alignment: .leading) {
                    
                    //phone number text
                    Text("Enter your valid phone number")
                        .font(.festerFont(customFontName: .FesterMedium, fontSize: 16))
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)
                    
                    HStack {
                        
                        //MARK: - Indian Flag
                        if phoneNumber.count == 10 {
                            Text("🇮🇳")
                                .padding(.leading)
                        }
                        
                        //MARK: - Phone Number TextFiled
                        TextField("Phone Number", text: $phoneNumber)
                            .textContentType(.telephoneNumber)
                            .padding()
                            .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
                            .foregroundColor(.white)
                            .autocorrectionDisabled(true)
                            .textContentType(.password)
                            .keyboardType(.numberPad)
                            .textInputAutocapitalization(.never)
                            .disabled(phoneNumber.count == 10)
                        
                        Spacer()
                        
                        //MARK: - Closer Button
                        Button {
                            phoneNumber = ""
                        } label: {
                            Image(systemName: "multiply.circle.fill")
                                .resizable()
                                .frame(width: phoneNumber.isEmpty ? 0 : 20, height: phoneNumber.isEmpty ? 0 : 20)
                                .foregroundColor(.white)
                        }
                        .disabled(phoneNumber.isEmpty)
                        .padding()
                    }
                    .background {
                        Capsule()
                            .stroke(!phoneNumber.isEmpty ? phoneNumber.count == 10 ? .white.opacity(0.6) : .yellow : .clear, lineWidth: !phoneNumber.isEmpty ?  3 : 0)
                        Capsule()
                            .fill(.white.opacity(0.3))
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom)
                }
                
                //MARK: - OTP button
                Button {
                    phoneVerifiyVM.sendOTP(phoneNumber: phoneNumber)
                } label: {
                    Text("Send OTP")
                        .font(.festerFont(customFontName: .FesterBold, fontSize: 16))
                        .foregroundColor(.white)
                        .frame(width: dynamicWidth-(dynamicWidth*0.19), height: 25)
                }
                .padding()
                .background {
                    Capsule()
                        .fill(phoneNumber.count != 10 ? GradientColors.grayGradient : GradientColors.orangeGradient)
                }
                .disabled(phoneNumber.count != 10)
                .navigationDestination(isPresented: $phoneVerifiyVM.isVerifiy) {
                    OTPView()
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
                
                Text("Or")
                    .font(.festerFont(customFontName: .FesterMedium, fontSize: 20))
                    .padding(.vertical, 20)
                
                //MARK: - Social Media Buttons
                VStack {
                    
                    Button {
                        
                    } label: {
                        HStack(spacing: 0) {
                            Image("google")
                                .resizable()
                                .frame(width: 25, height: 25)
                            
                            Text("Sign With Google")
                                .font(.festerFont(customFontName: .FesterMedium, fontSize: 20))
                                .foregroundColor(.black)
                                .frame(width: dynamicWidth/1.38, height: 25)
                        }
                    }
                    .padding()
                    .background {
                        Capsule()
                    }
                    .padding(.bottom ,5)
                    
                    Button {
                        
                    } label: {
                        HStack(spacing: 0) {
                            Image("apple")
                                .resizable()
                                .frame(width: 25, height: 25)
                            
                            Text("Sign With AppleID")
                                .font(.festerFont(customFontName: .FesterMedium, fontSize: 20))
                                .foregroundColor(.black)
                                .frame(width: dynamicWidth/1.38, height: 25)
                        }
                    }
                    .padding()
                    .background {
                        Capsule()
                    }
                    .padding(5)
                    
                    Button {
                        
                    } label: {
                        HStack(spacing: 0) {
                            Image("GitHub")
                                .resizable()
                                .frame(width: 25, height: 25)
                            
                            Text("Sign With GitHub")
                                .font(.festerFont(customFontName: .FesterMedium, fontSize: 20))
                                .foregroundColor(.black)
                                .frame(width: dynamicWidth/1.38, height: 25)
                        }
                    }
                    .padding()
                    .background {
                        Capsule()
                    }
                    .padding(5)
                    
                    Spacer()
                    
                }
                
                //MARK: - Custom Phone Number Pad...
                //          CustomPhoneNumberPad()
                //                .padding(dynamicHeight/20)
            }
        }
    }
}


struct PhoneVerifyView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneVerifyView()
    }
}
