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
    @StateObject var coreDataVM = DataModelController()
    @EnvironmentObject var emailAuthVM : EmailAuthenticationViewModel
    
    var body: some View {
        
        //MARK: - First Name
        OrangeBorderTextFiledView(textString: "First Name", text: $fName)
        
        //MARK: - Last Name
        OrangeBorderTextFiledView(textString: "Last Name", text: $lName)
        
        //MARK: - Email Address
        OrangeBorderTextFiledView(textString: "Email", text: $email)
        
        //MARK: - Phone Number
        OrangeBorderTextFiledView(textString: "Phone", text: $phone)
        
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
                validationTextFiled(password, bgColorFloat: 0.48)
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
    }
}
