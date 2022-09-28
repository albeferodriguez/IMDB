//
//  StatsInfoDTO.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 28/9/22.
//

import Foundation

struct StatsInfoDTO: Decodable {
    var base_stat: Int?
    var effort: Int?
    var stat: StatDTO?
}
