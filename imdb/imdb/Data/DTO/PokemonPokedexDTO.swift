//
//  PokemonPokedexDTO.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 26/9/22.
//

import Foundation

struct PokemonPokedexDTO: Decodable, Identifiable {
    var id: UUID
    var name: String?
    var url: String?
}
