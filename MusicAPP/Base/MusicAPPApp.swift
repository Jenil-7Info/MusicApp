//
//  MusicAPPApp.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 22/02/23.
//

import SwiftUI

@main
struct MusicAPPApp: App {
    
    @State private var isLogin: Bool = true
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SignInView()
            }
        }
    }
}
