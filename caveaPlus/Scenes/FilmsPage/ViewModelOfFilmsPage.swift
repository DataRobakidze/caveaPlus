//
//  ViewModel.swift
//  caveaPlus
//
//  Created by Data on 29.01.25.
//

import Foundation
import NetworkService

class ViewModelOfFilmsPage: ObservableObject {
    
    @Published var movies: [Movie] = []
    
    func fetchMovieList() {
        let urlString = "https://cavea.plus/api/v1/movies/list?lang=ka&limit=18&movieType=movie&order=newest"
        
        NetworkService().getData(urlString: urlString) { (result: Result<ItemsOfFilms, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let itemsOfFilms):
                    self.movies = itemsOfFilms.items
                    
                case .failure(let error):
                    print("Fetch failed: \(error.localizedDescription)")
                }
            }
        }
    }
}
