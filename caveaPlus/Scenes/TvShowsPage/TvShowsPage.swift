//
//  TvShowsPage.swift
//  caveaPlus
//
//  Created by Data on 17.01.25.
//

import SwiftUI

struct TvShowsPage: View {
    @StateObject var viewModel = ViewModelOfTvShowsPage()

    let gridItems = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 0) {
                    ForEach(viewModel.tvShows) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            MovieCell(movie: movie)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .simultaneousGesture(TapGesture().onEnded {
                            viewModel.impactFeedback()
                        })
                        
                    }
                }
            }
            .padding([.top, .leading, .trailing])
            .background(Color("MainBackgroundColor"))
            .scrollIndicators(.hidden)
            .refreshable {
                await viewModel.refreshTasks()
            }
            .onAppear {
                viewModel.fetchTvShowsList()
            }
        }
    }
}


#Preview {
    TvShowsPage()
}
