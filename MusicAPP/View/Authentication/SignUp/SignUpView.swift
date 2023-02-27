//
//  SignUpView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 22/02/23.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var fName: String = ""
    @State private var lName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isShowPass: Bool = false
    @State private var bgColorFloat: CGFloat = 0.5
    @State private var isPresentSignIN: Bool = false
    @EnvironmentObject var emailAuthVM : EmailAuthenticationViewModel
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                //MARK: - backGround Image and Colors...
                Image("Mountain")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
                Color.white.opacity(0.1)
                Color.black.opacity(0.25)
                
                VStack {
                    
                    //MARK: - Heading Title...
                    Text("Music App")
                        .font(.festerFont(customFontName: .FesterBold, fontSize: 50))
                        .overlay {
                            GradientColors.orangeGradient
                                .mask {
                                    Text("Music App")
                                        .font(.festerFont(customFontName: .FesterBold, fontSize: 50))
                                }
                        }
                        .padding(EdgeInsets(top: dynamicHeight/11, leading: 20, bottom: 30, trailing: 20))
                    
                    
                    //Firstnaem
                    TextField("First Name", text: $fName)
                        .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.words)
                        .padding()
                        .background {
                            ZStack {
                                Capsule()
                                    .fill(.white.opacity(bgColorFloat))
                            }
                        }
                        .padding(.horizontal, 20)
                    
                    //LastName
                    TextField("LastName", text: $lName)
                        .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.words)
                        .padding()
                        .background {
                            ZStack {
                                Capsule()
                                    .fill(.white.opacity(bgColorFloat))
                            }
                        }
                        .padding(.horizontal, 20)
                    
                    //Email Address
                    TextField("Email", text: $email)
                        .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .background {
                            ZStack {
                                Capsule()
                                    .fill(.white.opacity(bgColorFloat))
                            }
                        }
                        .padding(.horizontal, 20)
                    
                    //Password : Hide snd Show
                    if isShowPass {
                        HStack {
                            TextField("Password", text: $password)
                                .padding()
                                .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
                                .autocorrectionDisabled(true)
                                .textInputAutocapitalization(.never)
                            Image(systemName: isShowPass ? "eye.slash" : "eye")
                                .resizable()
                                .frame(width: 23, height: 16)
                                .padding(.trailing)
                                .onTapGesture {
                                    isShowPass.toggle()
                                }
                        }
                        .background {
                            Capsule()
                                .fill(.white.opacity(bgColorFloat))
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom)
                    }
                    else {
                        HStack {
                            SecureField("Password", text: $password)
                                .padding()
                                .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
                                .autocorrectionDisabled(true)
                                .textInputAutocapitalization(.never)
                            Image(systemName: isShowPass ? "eye.slash" : "eye")
                                .resizable()
                                .frame(width: 23, height: 16)
                                .padding(.trailing)
                                .onTapGesture {
                                    isShowPass.toggle()
                                }
                        }
                        .background {
                            Capsule()
                                .fill(.white.opacity(bgColorFloat))
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom)
                    }
                    
                    Button {
                        guard !fName.isEmpty || !lName.isEmpty || !email.isEmpty || !password.isEmpty || password.count >= 6 else { return }
                        
                        emailAuthVM.signUp("person.fill", fName, lName, email: email, pass: password, verification: .EmailAndPassAuth)
                    } label: {
                        Text("Sign Up")
                            .font(.festerFont(customFontName: .FesterCondensedExtraBold, fontSize: 22))
                            .foregroundColor(.white)
                            .padding()
                            .background {
                                Capsule()
                                    .fill(fName.isEmpty || lName.isEmpty || email.isEmpty || password.isEmpty || password.count != 6 ? GradientColors.grayGradient : GradientColors.orangeGradient)
                                    .frame(width: dynamicWidth-40)
                            }
                    }
                    .navigationDestination(isPresented: $emailAuthVM.isLoggIN, destination: {
                        SignInView()
                            .navigationBarBackButtonHidden(true)
                    })
                    .disabled(fName.isEmpty || lName.isEmpty || email.isEmpty || password.isEmpty || password.count != 6)
                    .padding(.bottom)
                    
                    HStack {
                        Text("Alrady Account?")
                            .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
                            .foregroundColor(.white)
                        
                        Button {
                            self.isPresentSignIN.toggle()
                        } label: {
                            Text("Sign In")
                                .font(.festerFont(customFontName: .FesterBold, fontSize: 20))
                                .foregroundColor(.white)
                        }
                        .navigationDestination(isPresented: $isPresentSignIN) {
                            SignInView()
                                .navigationBarBackButtonHidden(true)
                        }
                    }
                    .frame(maxHeight: .infinity ,alignment: .bottom)
                    .padding(.bottom)
                    
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(GoogleAutheticationViewModel())
            .environmentObject(EmailAuthenticationViewModel())
    }
}

