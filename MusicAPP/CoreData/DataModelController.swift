//
//  DataModelController.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 01/03/23.
//

import Foundation
import CoreData

class DataModelController: ObservableObject {
    
    let contanier = NSPersistentContainer(name: "DataModel")
    
    init() {
        contanier.loadPersistentStores { description, error in
            if let error = error {
                debugPrint(error.localizedDescription)
            }
        }
    }
}
