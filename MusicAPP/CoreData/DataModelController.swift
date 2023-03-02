//
//  DataModelController.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 01/03/23.
//

import Foundation
import CoreData

class DataModelController: ObservableObject {
    
    @Published var savedEntity: [UserDetail] = []
    let contanier = NSPersistentContainer(name: "DataModel")
    
    init() {
        contanier.loadPersistentStores { description, error in
            if let error = error {
                debugPrint(error.localizedDescription)
            }
        }
        fetchUserData()
    }
    
    //MARK: - Fetch the userdetails...
    func fetchUserData() {
        
        //Create the fetch Request Entity...
        let request = NSFetchRequest<UserDetail>(entityName: "UserDetail")
        
        do {
            //handle the fetch Request
            savedEntity = try contanier.viewContext.fetch(request)
        }
        catch let error as NSError {
            //If Request is not fetch then display the fatalError...
            fatalError("\(error.localizedDescription)")
        }
    }

    //MARK: - Add the New User
    func addUsers(_ image: String ,_ fname: String, _ lName: String, email: String, phone: String, pass: String) {
        //this connect the entity attributes
        let context = contanier.viewContext
        
        //store data as user
        let user = UserDetail(context: context)
        user.image = image
        user.givenName = fname
        user.familyName = lName
        user.email = email
        user.phone = phone
        user.password = pass
        
        //save user data...
        saveData()
    }
    
    //MARK: - update user detail...
    func updateUserDetail(image: String? ,fname: String? , lname: String?, email: String?, phone : String, pass: String?) {
        let newUserDetails = UserDetail()
        newUserDetails.image = image
        newUserDetails.givenName = fname
        newUserDetails.familyName = lname
        newUserDetails.email = email
        newUserDetails.phone = phone
        newUserDetails.password = pass
        
        saveData()
    }
    
    //MARK: - delete User...
    func deleteUser(indexSet: IndexSet) {
        
        //find the index No...
        guard let index = indexSet.first else { return }
        
        //use the index no in arr...
        let entity = savedEntity[index]
        
        //And last delete the specific data...
        contanier.viewContext.delete(entity)
        
        //save the user data
        saveData()
    }
    
    //MARK: - delete All User...
    func deleteAll() {
          let fetchRequest: NSFetchRequest<NSFetchRequestResult> = UserDetail.fetchRequest()
          let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try contanier.viewContext.execute(batchDeleteRequest)
        }
        catch let error as NSError {
            fatalError("\(error.localizedDescription)")
        }
        
        saveData()
    }
    
    //MARK: - Save the user details in core data...
    func saveData() {
        do {
            try contanier.viewContext.save()
            
            //refetch the user data...
            fetchUserData()
        }
        catch let error as NSError {
            //If Request is not fetch then display the fatalError...
            fatalError("\(error.localizedDescription)")
        }
    }
}
