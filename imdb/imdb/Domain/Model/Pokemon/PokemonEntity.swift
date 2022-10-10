//
//  PokemonEntity.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 26/9/22.
//

import Foundation
import SwiftUI

struct PokemonEntity: Identifiable {
    var id = UUID()
    var position: Int
    var name: String?
    var sprites: SpriteEntity?
    var types: [TypesEntity]?
    var forms: [FormsEntity]?
    var stats: [StatsInfoEntity]?
    var weight: Int?
    var height: Int?
    var typesConcatenated: String?
}
