//
//  PokedexPresenter.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 26/9/22.
//

import RxSwift
import SwiftUI

@MainActor
class PokedexPresenter: ObservableObject {

    var pokedexUseCase = GetPokedexUseCase(service: PokedexService())
    var pokemonUseCase = GetPokemonUseCase(service: PokemonService(url: "asdasd"))
    var disposeBag = DisposeBag()
    @Published var pokedexItems = [PokemonEntity]()

    func getPokedex() {
        _ = pokedexUseCase.getPokedex().subscribe(onNext: { [weak self] pokedex in
            if let listOfPokemons = pokedex.results {
                for pokemon in listOfPokemons {
                    if let url = pokemon.url {
                        self?.pokemonUseCase.getPokemon(url: url).subscribe { pokemonData in
                            self?.pokedexItems.append(pokemonData)
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
