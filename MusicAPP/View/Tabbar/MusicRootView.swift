//
//  MusicRootView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 22/02/23.
//

import SwiftUI

struct MusicRootView: View {
    
    var body: some View {
        NavigationStack {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                LibraryView()
                    .tabItem {
                        Image(systemName: "text.book.closed.fill")
                        Text("Library")
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
            }
        }
    }
}

struct MusicRootView_Previews: PreviewProvider {
    static var previews: some View {
        MusicRootView()
    }
}
