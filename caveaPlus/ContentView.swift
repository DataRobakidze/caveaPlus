//
//  ContentView.swift
//  caveaPlus
//
//  Created by Data on 16.01.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Label("მთავარი", image: "HomeIcon")
                }
            FilmsPage()
                .tabItem {
                    Label("ფილმები", image: "FilmsIcon")
                        .foregroundStyle(.white)
                }
            TvShowsPage()
                .tabItem {
                    Label("სერიალები", image: "TvSowsIcon")
                }
            CollectionsPage()
                .tabItem {
                    Label("კოლექცია", image: "CollectionIcon")
                }
        }
        .background(Color("MainBackgroundColor").edgesIgnoringSafeArea(.all)).opacity(0.8)
//        .accentColor(.white)
    }
}

#Preview {
    ContentView()
}
