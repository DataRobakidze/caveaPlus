//
//  ViewModel.swift
//  caveaPlus
//
//  Created by Data on 29.01.25.
//

import SwiftUI
import Foundation
import NetworkService

class ViewModelOfFilmsPage: ObservableObject {
    
//    @Published var movies: [Movie] = []
//    
//    func fetchMovieList() {
//        let urlString = "https://cavea.plus/api/v1/movies/list?lang=ka&limit=18&movieType=movie&order=newest"
//        
//        NetworkService().getData(urlString: urlString) { (result: Result<ItemsOfFilms, Error>) in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let itemsOfFilms):
//                    self.movies = itemsOfFilms.items
//                    
//                case .failure(let error):
//                    print("Fetch failed: \(error.localizedDescription)")
//                }
//            }
//        }
//    }
    
    
        
        @Published var movies: [Movie] = []
        @Published var selectedLanguage: String = "ka" // დაწყებული ენა ქართული
        
        // ფილმების ჩამოტვირთვა
        func fetchMovieList() {
            let urlString = "https://cavea.plus/api/v1/movies/list?lang=\(selectedLanguage)&limit=18&movieType=movie&order=newest"
            
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
        
        // ენის შეცვლა
        func changeLanguage(to language: String) {
            self.selectedLanguage = language
            fetchMovieList()  // ენის შეცვლის შემდეგ, ჩამოტვირთე ფილმები ახალი ენის მიხედვით
        }

    
    
    // Refresh function
    func refreshTasks() async {
        do {
            try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
            await MainActor.run {
                fetchMovieList()
            }
        } catch {
            print("Failed to refresh tasks: \(error)")
        }
    }
    
    
    func impactFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
}
