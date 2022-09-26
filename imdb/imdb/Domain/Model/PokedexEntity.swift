//
//  PokedexEntity.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 19/9/22.
//

import Foundation
import Alamofire
import RxSwift

struct PokedexEntity {
    var id: UUID = UUID()
    var count: Int?
    var next: String?
    var previous: String?
    var results: [PokemonPokedexEntity]?
}
