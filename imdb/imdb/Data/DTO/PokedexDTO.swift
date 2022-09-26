//
//  PokedexDTO.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 26/9/22.
//

import Foundation

struct PokedexDTO: Decodable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [PokemonPokedexDTO]?
}
