//
//  MusicRootView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 22/02/23.
//

import SwiftUI

struct MusicTabbarView: View {
    
    var body: some View {
        NavigationStack {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .clipped()
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                    .clipped()
                LibraryView()
                    .tabItem {
                        Image(systemName: "text.book.closed.fill")
                        Text("Library")
                    }
                    .clipped()
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                    .clipped()
            }
        }
    }
}

struct MusicTabbarView_Previews: PreviewProvider {
    static var previews: some View {
        MusicTabbarView()
            .environmentObject(GoogleAutheticationViewModel())
            .environmentObject(EmailAuthenticationViewModel())
            .environmentObject(PhoneVerificationViewModel())
    }
}
