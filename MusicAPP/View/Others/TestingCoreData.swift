//
//  TestingCoreData.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 01/03/23.
//

import Foundation
import SwiftUI


struct TestingCoreData:  View {
    
    @StateObject var coreDataVM = DataModelController()
    @State private var isAddUser: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(coreDataVM.savedEntity) { user in
                    VStack(alignment: .leading) {
                        Text(user.image ?? "")
                        Text(user.givenName ?? "")
                        Text(user.familyName ?? "")
                        Text(user.phone ?? "")
                        Text(user.email ?? "")
                        Text(user.password ?? "")
                    }
                }
                .onDelete(perform: coreDataVM.deleteUser)
            }
            .navigationTitle("User Details")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        coreDataVM.deleteAll()
                    } label: {
                        Text("Delete All")
                            .foregroundColor(.red)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.isAddUser.toggle()
                    } label: {
                        Image(systemName: "plus")
                        Text("Add User")
                    }
                    .navigationDestination(isPresented: $isAddUser) {
                        SignUpView()
                    }
                }
            }
        }
    }
}
