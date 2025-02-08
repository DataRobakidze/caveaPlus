//
//  Model.swift
//  caveaPlus
//
//  Created by Data on 29.01.25.
//

import Foundation

struct ItemsOfFilms: Decodable {
    var items: [Movie]
}

struct Movie: Identifiable, Decodable {
    var id: String
    var name: String
    var poster: String
    var label: LabelInfo?
}

struct LabelInfo: Decodable {
    var name: String
    var color: String
}
