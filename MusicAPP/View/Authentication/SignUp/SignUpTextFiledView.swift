//
//  SignUpTextFiledView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 10/03/23.
//

import SwiftUI

struct SignUpTextFiledView: View {
    
    @State private var fName: String = ""
    @State private var lName: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var password: String = ""
    @State private var isShowPass: Bool = false
    @State private var bgColorFloat: CGFloat = 0.48
    @State private var isTestingCoreData: Bool = false
    @EnvironmentObject var emailAuthVM : EmailAuthenticationViewModel
    
    var body: some View {
        
        //MARK: - First Name
        OrangeBorderTextFiledView(textString: "First Name", text: $fName)
            .keyboardType(.namePhonePad)
            .textContentType(.familyName)
        
        //MARK: - Last Name
        OrangeBorderTextFiledView(textString: "Last Name", text: $lName)
            .keyboardType(.namePhonePad)
            .textContentType(.familyName)
        
        //MARK: - Email Address
        OrangeBorderTextFiledView(textString: "Email", text: $email)
            .keyboardType(.emailAddress)
            .textContentType(.emailAddress)
        
        //MARK: - Phone Number
        HStack {
            
            //MARK: - Indian Flag
            if phone.count == 10 {
                Text("🇮🇳")
                    .padding(.leading)
            }
            
            //MARK: - Phone Number TextFiled
            TextField("Phone Number", text: $phone)
                .textContentType(.telephoneNumber)
                .padding()
                .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
                .foregroundColor(.white)
                .autocorrectionDisabled(true)
                .keyboardType(.numberPad)
                .textInputAutocapitalization(.never)
                .disabled(phone.count == 10)
                
            Spacer()
            
            //MARK: - Closer Button
            Button {
                phone = ""
            } label: {
                Image(systemName: "multiply.circle.fill")
                    .resizable()
                    .frame(width: phone.isEmpty ? 0 : 20, height: phone.isEmpty ? 0 : 20)
                    .foregroundColor(.white)
            }
            .disabled(phone.isEmpty)
            .padding()
        }
        .background {
            RoundedRectangle(cornerRadius: 15)
                .stroke(!phone.isEmpty ? phone.count == 10 ? .white.opacity(0.8) : .orange : .clear, lineWidth: !phone.isEmpty ?  3 : 0)
            RoundedRectangle(cornerRadius: 15)
                .fill(.white.opacity(0.48))
        }
        .padding(.horizontal, 20)
        
        //MARK: - Password: Hide And Show
        if isShowPass {
            HStack {
                TextField("Password", text: $password)
                    .padding()
                    .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
                    .textInputAutocapitalization(.never)
                    .foregroundColor(.white)
                    .textContentType(.password)
                    .keyboardType(.numbersAndPunctuation)
                    .autocorrectionDisabled(true)
                Image(systemName: isShowPass ? "eye.slash" : "eye")
                    .resizable()
                    .frame(width: 23, height: 16)
                    .padding(.trailing)
                    .onTapGesture {
                        withAnimation {
                            self.isShowPass.toggle()
                        }
                    }
            }
            .background {
                validationTextFiled(password, bgColorFloat: 0.48)
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
                    .foregroundColor(.white)
                    .autocorrectionDisabled(true)
                    .textContentType(.password)
                    .keyboardType(.numbersAndPunctuation)
                Image(systemName: isShowPass ? "eye.slash" : "eye")
                    .resizable()
                    .frame(width: 23, height: 16)
                    .padding(.trailing)
                    .onTapGesture {
                        withAnimation {
                            self.isShowPass.toggle()
                        }
                    }
            }
            .background {
                validationTextFiled(password, bgColorFloat: 0.48)
            }
            .padding(.horizontal, 20)
            .padding(.bottom)
        }
        
        //MARK: - EmailAuth && Coredata
        Button {
            
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
                    RoundedRectangle(cornerRadius: 15)
//                        .fill(fName.isEmpty || lName.isEmpty || email.isEmpty || password.isEmpty ? GradientColors.grayGradient : GradientColors.orangeGradient)
                        .fill(GradientColors.orangeGradient)
                        .frame(width: dynamicWidth-40)
                }
        }
        .navigationDestination(isPresented: $emailAuthVM.isLoggIN, destination: {
            MusicTabbarView()
                .navigationBarBackButtonHidden(true)
        })
        .disabled(fName.isEmpty || lName.isEmpty || email.isEmpty || password.isEmpty || phone.isEmpty)
        .padding(.bottom)
    }
    
    
}

struct SignUpTextFiledView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpTextFiledView()
            .environmentObject(EmailAuthenticationViewModel())
    }
}
