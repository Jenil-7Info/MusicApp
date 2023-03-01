//
//  TestingCoreData.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 01/03/23.
//

import Foundation
import SwiftUI


struct TestingCoreData:  View {
    
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<UserDetail>
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                VStack {
                    Text(user.givenName ?? "")
                    Text(user.familyName ?? "")
                    Text(user.phone ?? "")
                    Text(user.email ?? "")
                    Text(user.password ?? "")
                }
            }
            .navigationTitle("User Details")
        }
    }
}
