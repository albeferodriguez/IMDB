//
//  PokemonPokedexEntity.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 26/9/22.
//

import Foundation

struct PokemonPokedexEntity: Identifiable {
    var id: UUID = UUID()
    var name: String?
    var url: String?
}
