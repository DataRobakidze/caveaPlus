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
                    Label("ფილმები", systemImage: "film")
                        .foregroundStyle(.white)
                }
            TvShowsPage()
                .tabItem {
                    Label("სერიალები", systemImage: "list.and.film")
                }
            CollectionsPage()
                .tabItem {
                    Label("კოლექცია", systemImage: "square.and.arrow.down.fill")
                }
        }
        .accentColor(.white)
        .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithTransparentBackground() // გამჭვირვალე
            tabBarAppearance.backgroundColor = .mainBackground.withAlphaComponent(0.8)
            
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}

#Preview {
    ContentView()
}
