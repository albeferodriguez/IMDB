//
//  FilterPokemonPresenter.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 8/10/22.
//

import SwiftUI
import RxSwift

class FilterPokemonPresenter: ObservableObject {

    @Published var pokemonList: [PokemonEntity] = []

    private var disposeBag = DisposeBag()

    var pokedexUseCase = GetPokedexUseCase(service: PokedexService())
    var pokemonUseCase = GetPokemonUseCase(service: PokemonService(url: "asdasd"))

    func getAllPokemons() {
        _ = pokedexUseCase.getPokedex().subscribe(onNext: { [weak self] pokedex in
            if let listOfPokemons = pokedex.results {
                for pokemon in listOfPokemons {
                    if let url = pokemon.url {
                        self?.pokemonUseCase.getPokemon(url: url).subscribe { pokemonData in
                            self?.pokemonList.append(pokemonData)
                        } onError: { error in
                            print(error)
                        } onCompleted: {
                            print("completed")
                        }.disposed(by: self?.disposeBag ?? DisposeBag())
                    }
                }
            }
        }, onError: { error in
            print(error)
        }).disposed(by: self.disposeBag)
    }
}


