//
//  SearchView.swift
//  MusicAPP
//
//  Created by SevenInfosystem on 22/02/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchQuery: String = ""
    @State private var searchHistory: [String] = ["love mashup 2023"]
    @State private var isClosePlayView: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search here", text: $searchQuery)
                        .font(.festerFont(customFontName: .FesterMedium, fontSize: 18))
                        .foregroundColor(.white)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                    
                    Button {
                        self.searchQuery = ""
                    } label: {
                        Image(systemName: searchQuery.isEmpty ? "" : "multiply.circle.fill")
                            .foregroundColor(.white)
                    }
                }
                .padding(10)
                .background {
                    validationTextFiled(searchQuery,bgColorFloat: 0.48)
                }
                .padding(.horizontal)
                .onSubmit {
                    searchHistory.append(searchQuery)
                    searchQuery = ""
                }
                
                List(searchResult, id: \.self) { name in
                    Button {
                        if name == "love mashup 2023" {
                            self.isClosePlayView = true
                        }
                    } label: {
                        Text(name)
                    }
                    .navigationDestination(isPresented: $isClosePlayView) {
                        PlayView(fullMusicView: true)
                            .navigationBarBackButtonHidden(true)
                    }
                    
                }
            }
            VStack {
                Spacer()
                PlayView(fullMusicView: isClosePlayView)
            }
        }
    }
    
    var searchResult: [String] {
        if searchQuery.isEmpty {
            return searchHistory
        } else {
            return searchHistory.filter{ $0.contains(searchQuery) }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
