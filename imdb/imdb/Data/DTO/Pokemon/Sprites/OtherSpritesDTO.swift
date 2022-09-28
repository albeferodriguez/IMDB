//
//  OtherSpritesDTO.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 27/9/22.
//

import Foundation

struct OtherSpritesDTO: Decodable {
    var artWork: ArtWorkDTO?

    enum CodingKeys: String, CodingKey {
        case artWork = "official-artwork"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        artWork = try container.decodeIfPresent(ArtWorkDTO.self, forKey: .artWork)

    }
}
