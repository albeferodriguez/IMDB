//
//  StatsInfoEntity.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 28/9/22.
//

import Foundation

struct StatsInfoEntity: Identifiable {
    var id: UUID
    var baseStat: Int?
    var effort: Int?
    var stat: StatEntity?
}
