//
//  SpritesDTO.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 27/9/22.
//

import Foundation

struct SpritesDTO: Decodable {
    var slot: Int?
    var other: OtherSpritesDTO?
}
