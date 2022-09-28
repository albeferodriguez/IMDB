//
//  TypesEntity.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 26/9/22.
//

import Foundation

struct TypesEntity: Identifiable {
    var id = UUID()
    var slot: Int?
    var type: TypeEntity?
}
