//
//  PhoneVerifyView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 02/03/23.
//

import SwiftUI

struct PhoneVerifyView: View {
    
    @StateObject var phoneVerifiyVM = PhoneVerificationViewModel()
    @StateObject var googleAuthVM = GoogleAutheticationViewModel()
    @State private var isPresentOTPScreen: Bool = false
    @Environment(\.dismiss) var dismiss
    @State private var isSocialMediaLogin: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("phoneVerfication")
                    .resizable()
                    .ignoresSafeArea()
              
                //MARK: - Back Button
                VStack {
                    HStack {
                        Button {
                            dismiss.callAsFunction()
                        } label: {
                            Image(systemName: "arrow.left")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                            Text("Back")
                                .foregroundColor(.white)
                                .font(.system(size: 18))
                                .bold()
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    Spacer()
                }
                
                VStack(alignment: .center) {
                    
                    //MAORK: - Heading Of application
                    ApplicationTitle()
                        .padding(.top, isSocialMediaLogin ? 0 : 20)
                        .padding(30)
                    
                    HStack {
                        //phone number text
                        Text("Enter your valid phone number")
                            .font(.festerFont(customFontName: .FesterMedium, fontSize: 16))
                            .foregroundColor(.white)
                            .padding(.horizontal, 30)
                        Spacer()
                    }
                    
                    //MARK: - Phone Verfication Textfiled
                    HStack {
                        
                        //MARK: - Indian Flag
                        if phoneVerifiyVM.phone.count == 10 {
                            Text("🇮🇳")
                                .padding(.leading)
                        }
                        
                        //MARK: - Phone Number TextFiled
                        TextField("Phone Number", text: $phoneVerifiyVM.phone)
                            .textContentType(.telephoneNumber)
                            .padding()
                            .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
                            .foregroundColor(.white)
                            .autocorrectionDisabled(true)
                            .keyboardType(.numberPad)
                            .textInputAutocapitalization(.never)
                            .disabled(phoneVerifiyVM.phone.count == 10)
                            
                        
                        Spacer()
                        
                        //MARK: - Closer Button
                        Button {
                            phoneVerifiyVM.phone = ""
                        } label: {
                            Image(systemName: "multiply.circle.fill")
                                .resizable()
                                .frame(width: phoneVerifiyVM.phone.isEmpty ? 0 : 20, height: phoneVerifiyVM.phone.isEmpty ? 0 : 20)
                                .foregroundColor(.white)
                        }
                        .disabled(phoneVerifiyVM.phone.isEmpty)
                        .padding()
                    }
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(!phoneVerifiyVM.phone.isEmpty ? phoneVerifiyVM.phone.count == 10 ? .white.opacity(0.6) : .yellow : .clear, lineWidth: !phoneVerifiyVM.phone.isEmpty ?  3 : 0)
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.white.opacity(0.3))
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom)
                    
                    //MARK: - OTP button
                    Button {
                        phoneVerifiyVM.sendOTP()
                    } label: {
                        Text("Send OTP")
                            .font(.festerFont(customFontName: .FesterBold, fontSize: 16))
                            .foregroundColor(.white)
                            .frame(width: dynamicWidth-(dynamicWidth*0.19), height: 25)
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(phoneVerifiyVM.phone.count != 10 ? GradientColors.grayGradient : GradientColors.orangeGradient)
                    }
                    .disabled(phoneVerifiyVM.phone.count != 10)
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
                    
                    HStack {
                        Spacer()
                        Button {
                            withAnimation(.easeIn(duration: 0.2)) {
                                self.isSocialMediaLogin.toggle()
                            }
                        } label: {
                            Text(isSocialMediaLogin ? "Login with Phone Number" : "Login with Social Media")
                                .font(.system(size: 18))
                                .bold()
                                .foregroundColor(.white)
                        }
                        .padding(.top)
                    }
                    .padding(.horizontal, 20)
                    
                    if isSocialMediaLogin  {
                        
                        Text("Or")
                            .font(.festerFont(customFontName: .FesterMedium, fontSize: 20))
                            .padding(.vertical, 20)
                        
                        //MARK: - Social Media Buttons
                        VStack {
                            
                            Button {
                                googleAuthVM.signIn()
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
                            .navigationDestination(isPresented: $googleAuthVM.isLoggedIn) {
                                MusicTabbarView()
                                    .navigationBarBackButtonHidden(true)
                            }
                            
                            
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
                            
                            
                        }
                    }
                    
                    if !isSocialMediaLogin {
                        Spacer()
                    }
                }
            }
        }
    }
}


struct PhoneVerifyView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneVerifyView()
    }
}
