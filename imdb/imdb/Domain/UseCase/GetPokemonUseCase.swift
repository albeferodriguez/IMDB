//
//  GetPokemonUseCase.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 27/9/22.
//

import RxSwift
import SwiftUI

class GetPokemonUseCase {

    var service: PokemonRepository
    var position = 0

    init(service: PokemonRepository) {
        self.service = service
    }

    func getPokemon(url: String) -> Observable<PokemonEntity> {
        return self.service.getPokemon(url: url)
            .map { data -> PokemonEntity in

                if data.statusCode == 200, let pokemon = data.body {
                    let artWork = ArtWorkEntity(id: UUID(), frontImage: pokemon.sprites?.other?.artWork?.front_default)
                    let otherSprites = OtherSpritesEntity(id: UUID(), artWork: artWork)
                    let spritesEntity = SpriteEntity(id: UUID(), slot: pokemon.sprites?.slot, other: otherSprites)
                    var types = [TypesEntity]()
                    if let listOfTypes = pokemon.types {
                        for pokemonType in listOfTypes {
                            let typeConverted = TypeColorTransformer.getType(type: pokemonType.type?.name)
                            let type = TypesEntity(id: UUID(), name: typeConverted.0.rawValue, color: typeConverted.1)
                            types.append(type)
                        }
                    }

                    var typesConcatenated: String
                    if types.count > 1 {
                        typesConcatenated = "\(types[0].name!) / \(types[1].name!)"
                    } else {
                        typesConcatenated = types[0].name ?? ""
                    }

                    var forms = [FormsEntity]()
                    if let formsList = pokemon.forms {
                        for item in formsList {
                            forms.append(FormsEntity(id: UUID(), name: item.name, url: item.url))
                        }
                    }

                    var stats = [StatsInfoEntity]()
                    if let statsList = pokemon.stats {
                        for stat in statsList {
                            stats.append(
                                StatsInfoEntity(id: UUID(), baseStat: stat.base_stat ?? 0 < 100 ? stat.base_stat : 100, effort: stat.effort, stat: StatEntity(id: UUID(), name: stat.stat?.name, url: stat.stat?.url))
                            )
                        }
                    }
                    return PokemonEntity(id: UUID(), position: Int(url.split(separator: "/")[5]) ?? -1, name: forms[0].name?.capitalizingFirstLetter(), sprites: spritesEntity, types: types, forms: forms, stats: stats, weight: pokemon.weight, height: pokemon.height, typesConcatenated: typesConcatenated)
                }
                return PokemonEntity(id: UUID(), position: -1, sprites: nil, types: nil)
            }.asObservable()
    }
}
