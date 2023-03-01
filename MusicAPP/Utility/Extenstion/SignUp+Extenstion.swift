//
//  SignUp+Extenstion.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 01/03/23.
//

import Foundation

//MARK: -  Insert and save in core data
extension SignUpView {
    
    func insertData(_ firstName: String, _ lastName: String, email: String, pass: String) {
        
        let newUser = UserDetail(context: context)
        newUser.givenName = firstName
        newUser.familyName = lastName
        newUser.image = "person.fill"
        newUser.email = email
        newUser.password = pass
        
        saveData()
    }
    
    func saveData() {
        do {
            try context.save()
        } catch {
            fatalError("Error: \(error.localizedDescription)")
        }
    }
}
