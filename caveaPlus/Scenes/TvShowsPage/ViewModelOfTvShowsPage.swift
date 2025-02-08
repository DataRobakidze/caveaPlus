//
//  ViewModelOfTvShowsPage.swift
//  caveaPlus
//
//  Created by Data on 30.01.25.
//

import Foundation
import NetworkService

class ViewModelOfTvShowsPage: ObservableObject {
    
    @Published var tvShows: [Movie] = []
    
    // Fetch the movie list from the API
    func fetchTvShowsList() {
        let urlString = "https://cavea.plus/api/v1/movies/list?lang=ka&distributors=amedia&limit=18&movieType=series&order=newest"
        
        NetworkService().getData(urlString: urlString) { (result: Result<ItemsOfFilms, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let itemsOfFilms):
                    self.tvShows = itemsOfFilms.items
                case .failure(let error):
                    print("Fetch failed: \(error.localizedDescription)")
                }
            }
        }
    }
}
