//
//  PhoneVerifyView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 02/03/23.
//

import SwiftUI

struct PhoneVerifyView: View {
    
    @StateObject var phoneVerifiyVM = PhoneVerificationViewModel()
    @State private var PhoneNumber: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {

                Text("Code sent \(phoneVerifiyVM.phone)")
                    .padding(EdgeInsets(top: 100, leading: 20, bottom: 20, trailing: 20))
                    .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
                
                TextField("Phone Number", text: $PhoneNumber)
                    .padding()
                    .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
                    .foregroundColor(.white)
                    .autocorrectionDisabled(true)
                    .textContentType(.password)
                    .keyboardType(.numbersAndPunctuation)
                    .textInputAutocapitalization(.never)
                    .background {
                        Capsule()
                            .stroke(!PhoneNumber.isEmpty ? .white : .clear , lineWidth: !PhoneNumber.isEmpty ?  3 : 0)
                        Capsule()
                            .fill(.white.opacity(0.3))
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom)
                
                Spacer()
            }
            .navigationTitle("Phone Verification")
        }
    }
}


struct PhoneVerifyView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneVerifyView()
    }
}
