//
//  GetPokedexUseCase.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 26/9/22.
//

import RxSwift

class GetPokedexUseCase {

    let service: PokedexRepository
    let userDefaults = CacheManager.shared

    init (service: PokedexRepository) {
        self.service = service
    }

    func getPokedex() -> Observable<PokedexEntity> {
        return self.service.getPokedex(limit: 20, offset: 0)
            .map { data -> PokedexEntity in

                if data.statusCode == 200, let pokedex = data.body {
                    var listOfPokemons: [PokemonPokedexEntity] = []

                    if let pokemonList = pokedex.results {
                        for pokemon in pokemonList {
                            listOfPokemons.append(PokemonPokedexEntity(name: pokemon.name, url: pokemon.url))
                        }
                    }
                    return PokedexEntity(count: pokedex.count, next: pokedex.next, previous: pokedex.previous, results: listOfPokemons)
                }
                return PokedexEntity(id: UUID())
            }.asObservable()
    }
}
