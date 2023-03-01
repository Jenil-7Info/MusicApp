//
//  SignInView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 22/02/23.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn
import FirebaseAuth

struct SignInView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isShowPass: Bool = false
    @State private var bgColorFloat: CGFloat = 0.5
    @State private var isPresentSignUp: Bool = false
    @State private var isGoogleVerification: Bool = false
    @EnvironmentObject var googleAuthVM : GoogleAutheticationViewModel
    @EnvironmentObject var emailAuthVM : EmailAuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var userDetails: FetchedResults<UserDetail>
    
    var body: some View {
        ZStack {
            //MARK: - backGround Image and Colors...
            Image("Mount3")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .scaledToFill()
            
            Color.white.opacity(0.1)
            Color.black.opacity(0.25)
            
            VStack {
                //MARK: - Heading Title...
                Text("Welcome Again!")
                    .font(.festerFont(customFontName: .FesterMedium, fontSize: 20))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 30, leading: 20, bottom: 8, trailing: 20))
                
                Text("Music App")
                    .font(.festerFont(customFontName: .FesterBold, fontSize: 50))
                    .overlay {
                        GradientColors.orangeGradient
                            .mask {
                                Text("Music App")
                                    .font(.festerFont(customFontName: .FesterBold, fontSize: 50))
                            }
                    }
                    .padding(.bottom, 30)
                
                //Email Address
                TextField("Email Address", text: $email)
                    .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
                    .foregroundColor(.black)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background {
                        Capsule()
                            .stroke(!email.isEmpty ? .orange : .clear , lineWidth:!email.isEmpty || !password.isEmpty ?  3 : 0)
                        Capsule()
                            .fill(.white.opacity(bgColorFloat))
                    }
                    .padding(.horizontal, 20)
                
                //Password : Hide snd Show
                if isShowPass {
                    HStack {
                        TextField("Password", text: $password)
                            .padding()
                            .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
                            .foregroundColor(.black)
                            .autocorrectionDisabled(true)
                            .textContentType(.password)
                            .keyboardType(.numbersAndPunctuation)
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
                            .stroke(!password.isEmpty ? .orange : .clear , lineWidth:!email.isEmpty || !password.isEmpty ?  3 : 0)
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
                            .foregroundColor(.black)
                            .autocorrectionDisabled(true)
                            .textContentType(.password)
                            .keyboardType(.numbersAndPunctuation)
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
                            .stroke(!password.isEmpty ? .orange : .clear , lineWidth:!email.isEmpty || !password.isEmpty ?  3 : 0)
                        Capsule()
                            .fill(.white.opacity(bgColorFloat))
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom)
                }
                
                //MARK: - Change Password
                HStack {
                    Spacer()
                    Button {
                        DispatchQueue.main.async {
                            emailAuthVM.resetPassEmailVerification(emailAdd: email)
                        }
                    } label: {
                        Text("Change Password")
                            .font(.festerFont(customFontName: .FesterBold, fontSize: 15))
                            .foregroundColor(.white)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 22, bottom: 20, trailing: 22))
                
                Button {
                    guard !email.isEmpty || !password.isEmpty else { return }
                    
                    emailAuthVM.signIn(email: email, pass: password, verification: .EmailAndPassAuth)
                    
                    email = ""
                    password = ""
                } label: {
                    Text("Sign IN")
                        .font(.festerFont(customFontName: .FesterCondensedExtraBold, fontSize: 22))
                        .foregroundColor(.white)
                        .padding()
                        .background {
                            Capsule()
                                .fill(email.isEmpty || password.isEmpty ? GradientColors.grayGradient : GradientColors.orangeGradient)
                                .frame(width: dynamicWidth-40)
                        }
                }
                .navigationDestination(isPresented: $emailAuthVM.isLoggIN, destination: {
                    MusicRootView()
                        .navigationBarBackButtonHidden(true)
                })
                .disabled(email.isEmpty || password.isEmpty)
                .alert("Alert", isPresented: $emailAuthVM.isAlert, actions: {
                    Button {
                        dismiss.callAsFunction()
                    } label: {
                        Text("OK")
                    }
                }, message: {
                    Text(emailAuthVM.errMessage)
                })
                .padding(.bottom)
                
                //MARK: -  Social Media Login...
                Text("Login With")
                    .font(.festerFont(customFontName: .FesterMedium, fontSize: 20))
                    .foregroundColor(.white)
                
                HStack(spacing: 40) {
                    
                    Button {
                        
                    } label: {
                        Image("facebook")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .background {
                                Circle()
                                    .fill(.white.opacity(bgColorFloat))
                            }
                    }
                    
                    
                    Button {
                        googleAuthVM.signIn()
                    } label: {
                        Image("google")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .background {
                                Circle()
                                    .fill(.white.opacity(bgColorFloat))
                            }
                    }
                    .navigationDestination(isPresented: $googleAuthVM.isLoggedIn) {
                        MusicRootView()
                            .navigationBarBackButtonHidden(true)
                    }
                    
                    Button {
                        
                    } label: {
                        Image("GitHub")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .background {
                                Circle()
                                    .fill(.white.opacity(bgColorFloat))
                            }
                    }
                    
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
                
                HStack {
                    Text("New User?")
                        .font(.festerFont(customFontName: .FesterMedium, fontSize: 20))
                        .foregroundColor(.white)
                    
                    Button {
                        self.isPresentSignUp = true
                    } label: {
                        Text("Sign Up")
                            .font(.festerFont(customFontName: .FesterBold, fontSize: 21))
                            .foregroundColor(.white)
                    }
                    .navigationDestination(isPresented: $isPresentSignUp) {
                        SignUpView()
                            .navigationBarBackButtonHidden(true)
                    }
                }
                .padding(.bottom)
                
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(GoogleAutheticationViewModel())
            .environmentObject(EmailAuthenticationViewModel())
    }
}
