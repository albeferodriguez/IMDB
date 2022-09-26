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
    var id: UUID
    var count: Int?
    var next: Int?
    var previous: Int?
    var results: [PokemonPokedexDTO]?
}
