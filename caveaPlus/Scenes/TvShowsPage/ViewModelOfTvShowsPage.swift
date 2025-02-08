//
//  ViewModelOfTvShowsPage.swift
//  caveaPlus
//
//  Created by Data on 30.01.25.
//

import SwiftUI
import Foundation
import NetworkService

class ViewModelOfTvShowsPage: ObservableObject {
    
    @Published var tvShows: [Movie] = []
    
    // Fetch the movie list from the API
//    func fetchTvShowsList() {
//        let urlString = "https://cavea.plus/api/v1/movies/list?lang=ka&distributors=amedia&limit=18&movieType=series&order=newest"
//        
//        NetworkService().getData(urlString: urlString) { (result: Result<ItemsOfFilms, Error>) in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let itemsOfFilms):
//                    self.tvShows = itemsOfFilms.items
//                case .failure(let error):
//                    print("Fetch failed: \(error.localizedDescription)")
//                }
//            }
//        }
//    }
    
    func fetchTvShowsList() {
        let urlString = "https://cavea.plus/api/v1/movies/list?lang=ka&distributors=amedia&limit=18&movieType=series&order=newest"
        
        NetworkService().getData(urlString: urlString) { (result: Result<ItemsOfFilms, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let itemsOfFilms):
                    self.tvShows.removeAll()
                    self.tvShows.append(contentsOf: itemsOfFilms.items) // ახალი მონაცემების დამატება
                case .failure(let error):
                    print("Fetch failed: \(error.localizedDescription)")
                }
            }
        }
    }
    
    
    
    // Refresh function
    func refreshTasks() async {
        do {
            try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
            fetchTvShowsList()
        } catch {
            print("Failed to refresh tasks: \(error)")
        }
    }
    
    
    func impactFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
}
