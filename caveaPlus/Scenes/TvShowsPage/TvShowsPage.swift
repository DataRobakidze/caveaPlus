//
//  TvShowsPage.swift
//  caveaPlus
//
//  Created by Data on 17.01.25.
//

import SwiftUI

struct TvShowsPage: View {
    @StateObject var viewModel = ViewModelOfTvShowsPage()

    let gridItems = Array(repeating: GridItem(.flexible(), spacing: 10), count: 3)

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 0) {
                    ForEach(viewModel.tvShows) { movie in
                        // NavigationLink to the detail view
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            MovieCell(movie: movie)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .background(Color("MainBackgroundColor"))
            .onAppear {
                Task {
                    viewModel.fetchTvShowsList()
                }
            }
        }
    }
}

#Preview {
    TvShowsPage()
}
