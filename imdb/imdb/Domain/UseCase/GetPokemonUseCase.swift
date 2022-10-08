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

    init(service: PokemonRepository) {
        self.service = service
    }

    func getPokemon(url: String) -> Observable<PokemonEntity> {
        return self.service.getPokemon(url: url)
            .map { data -> PokemonEntity in

                var typeColors = [(Types, Color)]()

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
                    return PokemonEntity(id: UUID(), name: forms[0].name?.capitalizingFirstLetter(), sprites: spritesEntity, types: types, forms: forms, stats: stats)
                }
                return PokemonEntity(id: UUID(), sprites: nil, types: nil)
            }.asObservable()
    }
}
