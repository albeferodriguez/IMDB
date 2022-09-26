//
//  PokedexDTO.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 26/9/22.
//

import Foundation

struct PokedexDTO: Decodable, Identifiable {
    var id: UUID
    var count: Int?
    var next: Int?
    var previous: Int?
    var results: [PokemonPokedexDTO]?
}
