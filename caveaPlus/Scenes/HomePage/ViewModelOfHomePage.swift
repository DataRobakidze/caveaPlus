//
//  ViewModelOfHomePage.swift
//  caveaPlus
//
//  Created by Data on 08.02.25.
//

import Foundation
import NetworkService

class ViewModelOfHomePage: ObservableObject {
    
    @Published var itemsList: [Items] = []  // შეცვლილი ვარიაბლის სახელი

    func fetchMovieList() {
        let urlString = "https://cavea.plus/api/v1/blocks?lang=ka&limit=21"
        
        NetworkService().getData(urlString: urlString) { (result: Result<ItemsOfAllFilms, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let itemsOfFilms):
                    self.itemsList = itemsOfFilms.items  // ვარიაბლის განახლება
                    
                case .failure(let error):
                    print("Fetch failed: \(error.localizedDescription)")
                }
            }
        }
    }
}
