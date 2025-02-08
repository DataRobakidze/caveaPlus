//
//  ModelOfHomePage.swift
//  caveaPlus
//
//  Created by Data on 08.02.25.
//

import Foundation

struct ItemsOfAllFilms: Decodable {
    var items: [Items]
}

struct Items: Identifiable, Decodable {
    var id: String
    var title: String
    var movies: [MovieSection]
}

struct MovieSection: Decodable {
    var id: String
    var name: String
}
