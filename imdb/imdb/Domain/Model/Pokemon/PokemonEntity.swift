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
    var name: String?
    var sprites: SpriteEntity?
    var types: [TypesEntity]?
    var forms: [FormsEntity]?
}
