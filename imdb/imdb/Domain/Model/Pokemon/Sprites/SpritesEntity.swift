//
//  SpritesEntity.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 26/9/22.
//

import Foundation

struct SpriteEntity: Identifiable {
    var id = UUID()
    var slot: Int?
    var other: OtherSpritesEntity?
}
