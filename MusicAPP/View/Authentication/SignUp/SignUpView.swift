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
    @State private var phone: String = ""
    @State private var password: String = ""
    @State private var isShowPass: Bool = false
    @State private var bgColorFloat: CGFloat = 0.5
    @State private var isPresentSignIN: Bool = false
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var emailAuthVM : EmailAuthenticationViewModel
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: []) var userDetails: FetchedResults<UserDetail>
    
    var body: some View {
        ZStack {
            
            GeometryReader { GeometryProxy in
                Image("Mountain")
                    .resizable()
                    .scaledToFill()
                    .frame(width: GeometryProxy.size.width, height: GeometryProxy.size.height)
                
                Color.white.opacity(0.1)
                Color.black.opacity(0.25)
            }
            //MARK: - backGround Image and Colors...
            
            VStack {
                
                HStack {
                    Button {
                        dismiss.callAsFunction()
                    } label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .bold()
                            .padding(.trailing, 6)
                        
                        Text("Sign In")
                            .font(.festerFont(customFontName: .FesterBold, fontSize: 18))
                            .foregroundColor(.white)
                    }

                    Spacer()
                }
                .padding(.horizontal)
                
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
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                
                
                //Firstnaem
                TextField("First Name", text: $fName)
                    .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
                    .foregroundColor(.black)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.words)
                    .textContentType(.givenName)
                    .keyboardType(.numbersAndPunctuation)
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
                    .foregroundColor(.black)
                    .textInputAutocapitalization(.words)
                    .autocorrectionDisabled(true)
                    .textContentType(.familyName)
                    .keyboardType(.numbersAndPunctuation)
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
                    .foregroundColor(.black)
                    .textInputAutocapitalization(.never)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled(true)
                    .padding()
                    .background {
                        ZStack {
                            Capsule()
                                .fill(.white.opacity(bgColorFloat))
                        }
                    }
                    .padding(.horizontal, 20)
                
                //Email Address
                TextField("Phone", text: $phone)
                    .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
                    .foregroundColor(.black)
                    .textInputAutocapitalization(.never)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled(true)
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
                            .textInputAutocapitalization(.never)
                            .foregroundColor(.black)
                            .textContentType(.password)
                            .keyboardType(.numbersAndPunctuation)
                            .autocorrectionDisabled(true)
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
                            .textInputAutocapitalization(.never)
                            .foregroundColor(.black)
                            .autocorrectionDisabled(true)
                            .textContentType(.password)
                            .keyboardType(.numbersAndPunctuation)
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
                    guard !fName.isEmpty || !lName.isEmpty || !email.isEmpty || !password.isEmpty else { return }
                    
                    self.isPresentSignIN.toggle()
                    
                    //user data store in coreData...
                    insertData(fName, lName, phone: phone, email: email, pass: password)
                    
                    //emailAuthentication fuction...
                  //  emailAuthVM.signUp("person.fill", fName, lName, email: email, pass: password, verification: .EmailAndPassAuth)
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
                    //SignInView()
                    TestingCoreData()
                        .navigationBarBackButtonHidden(true)
                })
                .disabled(fName.isEmpty || lName.isEmpty || email.isEmpty || password.isEmpty)
                .padding(.bottom)
                
//                HStack {
//                    Text("Alrady Account?")
//                        .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
//                        .foregroundColor(.white)
//
//                    Button {
//                        self.isPresentSignIN.toggle()
//                    } label: {
//                        Text("Sign In")
//                            .font(.festerFont(customFontName: .FesterBold, fontSize: 20))
//                            .foregroundColor(.white)
//                    }
//                    .navigationDestination(isPresented: $isPresentSignIN) {
//                        SignInView()
//                            .navigationBarBackButtonHidden(true)
//                    }
//                }
//                .padding(.top, 20)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(EmailAuthenticationViewModel())
    }
}

