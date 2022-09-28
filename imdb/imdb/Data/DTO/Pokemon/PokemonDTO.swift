//
//  PokemonDTO.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 27/9/22.
//

import Foundation

struct PokemonDTO: Decodable {
    var sprites: SpritesDTO?
    var types: [TypesDTO]?
    var forms: [FormsDTO]?
}
