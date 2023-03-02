//
//  SignUpView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 22/02/23.
//

import SwiftUI

struct SignUpView: View {
    
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
            SignUpMainView()
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

struct MiddleOfSignUP: View {
    
    @State private var fName: String = ""
    @State private var lName: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var password: String = ""
    @State private var isShowPass: Bool = false
    @State private var bgColorFloat: CGFloat = 0.5
    @State private var isTestingCoreData: Bool = false
    @StateObject var coreDataVM = DataModelController()
    @EnvironmentObject var emailAuthVM : EmailAuthenticationViewModel
    
    var body: some View {
        
        //MARK: - First Name
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
        
        //MARK: - Last Name
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
        
        //MARK: - Email Address
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
        
        //MARK: - Phone Number
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
        
        //MARK: - Password: Hide And Show
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
        
        //MARK: - EmailAuth && Coredata
        Button {
            
            // add the userDetails in coreData
            self.coreDataVM.addUsers("person.fill", fName, lName, email: email, phone: phone, pass: password)
            
            //add the Email Authentication
            emailAuthVM.signUp("person.fill", fName, lName, email: email, pass: password, phone: phone, verification: .EmailAndPassAuth)
            
            self.fName = ""
            self.lName = ""
            self.email = ""
            self.phone = ""
            self.password = ""
            
        } label: {
            Text("Sign Up")
                .font(.festerFont(customFontName: .FesterCondensedExtraBold, fontSize: 22))
                .foregroundColor(.white)
                .padding()
                .background {
                    Capsule()
                        .fill(fName.isEmpty || lName.isEmpty || email.isEmpty || password.isEmpty ? GradientColors.grayGradient : GradientColors.orangeGradient)
                        .frame(width: dynamicWidth-40)
                }
        }
        .disabled(fName.isEmpty || lName.isEmpty || email.isEmpty || password.isEmpty || phone.isEmpty)
        .navigationDestination(isPresented: $emailAuthVM.isLoggIN, destination: {
            MusicRootView()
        })
        .padding(.bottom)
        
    }
}
