//
//  GoogleAutheticationViewModel.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 25/02/23.
//

import Foundation
import GoogleSignIn

//MARK: - Google Authentication View Model...
class GoogleAutheticationViewModel: ObservableObject {
    
    @Published var givenName: String = ""
    @Published var profilePicUrl: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String = ""
    
    init() {
        self.check()
    }
    
    func checkStatus() {
        
        //Current User is not available...
        if(GIDSignIn.sharedInstance.currentUser != nil){
            
            //Create user instance
            let user = GIDSignIn.sharedInstance.currentUser
            guard let user = user else { return }
            
            //get the userName in Email Address
            let givenName = user.profile?.givenName
            
            //Fetch the Profile URL
            let profilePicUrl = user.profile?.imageURL(withDimension: 100)?.absoluteString
            
            //store the name in Published var
            self.givenName = givenName ?? ""
            
            //store the ProfileURL in Published var
            self.profilePicUrl = profilePicUrl ?? ""
            
            //Apply Logic Login And Logout
            self.isLoggedIn = true
            
        }else{
            
            //Apply Logic Login And Logout
            self.isLoggedIn = false
            
            //If user Login unsucessfully then store this Emptyname
            self.givenName = "Not Logged In"
            
            //If user Login unsucessfully then store this Emptypic
            self.profilePicUrl =  ""
        }
    }
    
    func check() {
        
        //Call GIDSignIn restorePreviousSignIn
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            }
            
            //Call this function
            self.checkStatus()
        }
    }
    
    func signIn() {
        
        //Create rootViewController...
        guard let rootViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else { return }
        
        //Create the Configration ClientID...
        //this ClientID Store the Project > target > info > custom IOs target properties > + > GIDClientID : String : "This ClientID Store"
        let signInConfig = GIDConfiguration.init(clientID: "1042759169923-tr3rbvqdbo7jebs5nb601u5amsv381od.apps.googleusercontent.com")
        
        //also store the...
        GIDSignIn.sharedInstance.configuration = signInConfig
        
        //login process...
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
            if let error = error {
                debugPrint(error.localizedDescription)
            }
            self.checkStatus()
        }
    }
    
    //Logout process
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        self.checkStatus()
    }
}

//MARK: - Steps For Google Authentication...
/*
 --------
 -:Note:-
 --------
        Full Steps :- "https://paulallies.medium.com/google-sign-in-swiftui-2909e01ea4ed"
        Full Video :- "https://www.youtube.com/watch?v=IzyOdKm0bWE&t=203s"
 
 1. Create this File...
 2. Write the Google Authentication Code
    - If Any Esuue then Go to "https://firebase.google.com/docs/auth/ios/google-signin"
    - this is also provide the Swift codes And Videos...
 3. also include the yourproject base swift file.
 4. Base file:-
    - Create StateObject : GoogleAuthenticationViewModel
    - Added the .enviremontObject(StateObject)
 5. Create new sign in file.
    - Add the StateObject
    - Create New Google Button And Apply the self.googleVM.SignIN()
    - Added the navigationdestionView : $googleVM.isLogIn { EmptyView() }
    - If Any Esuue then Go to "https://firebase.google.com/docs/auth/ios/google-signin"
 6. Create new signout file.
    - Add the StateObject
    - Create New Logout Button And Apply the self.googleVM.SignOut()
    - If Any Esuue then Go to "https://firebase.google.com/docs/auth/ios/google-signin"
    //MARK:- priview is Not Working this File, So I will suggest preview_provider close this file.
 */