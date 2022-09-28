//
//  GetPokemonUseCase.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 27/9/22.
//

import RxSwift

class GetPokemonUseCase {

    var service: PokemonRepository

    init(service: PokemonRepository) {
        self.service = service
    }

    func getPokemon(url: String) -> Observable<PokemonEntity> {
        return self.service.getPokemon(url: url)
            .map { data -> PokemonEntity in

                if data.statusCode == 200, let pokemon = data.body {
                    let dreamWorld = DreamWorldEntity(id: UUID(), frontImage: pokemon.sprites?.other?.dream_world?.front_default)
                    let otherSprites = OtherSpritesEntity(id: UUID(), dreamWorld: dreamWorld)
                    let spritesEntity = SpriteEntity(id: UUID(), slot: pokemon.sprites?.slot, other: otherSprites)
                    var types = [TypesEntity]()
                    if let listOfTypes = pokemon.types {
                        for pokemonType in listOfTypes {
                            let type = TypeEntity(id: UUID(), name: pokemonType.type?.name, url: pokemonType.type?.url)
                            types.append(TypesEntity(id: UUID(), slot: pokemonType.slot, type: type))
                        }
                    }
                    var forms = [FormsEntity]()
                    if let formsList = pokemon.forms {
                        for item in formsList {
                            forms.append(FormsEntity(id: UUID(), name: item.name, url: item.url))
                        }
                    }
                    return PokemonEntity(id: UUID(), name: forms[0].name, sprites: spritesEntity, types: types, forms: forms)
                }
                return PokemonEntity(id: UUID(), sprites: nil, types: nil)
            }.asObservable()
    }
}
