//
//  AppleAuthenitication.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 20/03/23.
//

import Foundation
import SwiftUI
import Firebase
import CryptoKit
import AuthenticationServices


class AppleAutheniticationViewModel: NSObject ,ObservableObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
        
    @Published var isError: Bool = false
    @Published var errMessage: String = ""
    private var currentNouce: String?
    // Unhashed nonce.
    fileprivate var currentNonce: String?

    @available(iOS 13, *)
    func startSignInWithAppleFlow() {
      let nonce = randomNonceString()
      currentNonce = nonce
      let appleIDProvider = ASAuthorizationAppleIDProvider()
      let request = appleIDProvider.createRequest()
      request.requestedScopes = [.fullName, .email]
      request.nonce = sha256(nonce)

      let authorizationController = ASAuthorizationController(authorizationRequests: [request])
      authorizationController.delegate = self
      authorizationController.presentationContextProvider = self
      authorizationController.performRequests()
    }
    
    //MARK: - Handle the appleId Data
    func handleSigInWithApple(_ request: ASAuthorizationAppleIDRequest) {
        
        //Get the Full name and Email Address
        request.requestedScopes = [.fullName, .email]
        
        //AutoGenrated Random String
        let nouce = randomNonceString()
        
        //store the Random String
        currentNouce =  nouce
        
        //Convert sha256 and store value in request nonce
        request.nonce = sha256(nouce)
    }
    
    //MARK: - Handle the AppleId Login Complition
    func handleSigInWithAppleComplation(_ result: Result<ASAuthorization, Error>) {
        
        //check the status
        if case .failure(let failure) = result {
            
            //Store the Error data in Publised var
            self.isError = true
            self.errMessage = failure.localizedDescription
            debugPrint("ERROR:- \(failure.localizedDescription)")
        }
        else if case .success(let success) = result {
            
            //If Sucess the credential then store the credental as ASAuthorizationAppleIDCredential
            if let appleIDCredential = success.credential as? ASAuthorizationAppleIDCredential {
                
                //store and handle the request nonce
                guard let nonce = currentNouce else {
                    self.isError = true
                    self.errMessage = "Invalid Status: a Login was recevied."
                    fatalError("Invalid Status: a Login was recevied.")
                }
                
                //Create appleIdToken
                guard let appleIDToken = appleIDCredential.identityToken else {
                    self.isError = true
                    self.errMessage = "Unable to fetch identity Token"
                    debugPrint("ERROR:- Unable to fetch identity Token")
                    return
                }
                
                //Create idTokenString
                guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                    self.isError = true
                    self.errMessage = "Unable to serialise token string from data: \(appleIDToken.debugDescription)"
                    debugPrint("Unable to serialise token string from data: \(appleIDToken.debugDescription)") //appleId Token Print
                    return
                }
                
                //Create crediential
                let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                          idToken: idTokenString,
                                                          rawNonce: nonce)
                //Handle Task
                Task {
                    do {
                        let result = try await Auth.auth().signIn(with: credential)
                        debugPrint("Result:- \(result)")
                        self.isError = false
                    } catch {
                        self.isError = true
                        self.errMessage = errMessage.lowercased()
                        debugPrint(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    private func randomNonceString(length: Int = 32) -> String {
            precondition(length > 0)
            let charset: [Character] =
                Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
            var result = ""
            var remainingLength = length

            while remainingLength > 0 {
                let randoms: [UInt8] = (0 ..< 16).map { _ in
                    var random: UInt8 = 0
                    let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                    if errorCode != errSecSuccess {
                        fatalError(
                            "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
                        )
                    }
                    return random
                }

                randoms.forEach { random in
                    if remainingLength == 0 {
                        return
                    }

                    if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                    }
                }
            }

            return result
        }

    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()

        return hashString
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        ASPresentationAnchor()
    }
}
