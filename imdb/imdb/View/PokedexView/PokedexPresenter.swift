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
    var pokedexItemsMemento = [PokemonEntity]()
    @Published var pokedexItems = [PokemonEntity]()
    @Published var textToFind = "" {
        didSet {
            self.filterListByName(textToSearch: textToFind)
        }
    }
    var next: String?
    var previous: String?

    func getPokedex(url: String? = nil) {
        _ = pokedexUseCase.getPokedex().subscribe(onNext: { [weak self] pokedex in
            if let listOfPokemons = pokedex.results {
                for pokemon in listOfPokemons {
                    if let url = pokemon.url {
                        self?.pokemonUseCase.getPokemon(url: url).subscribe { pokemonData in
                            self?.pokedexItems.append(pokemonData)
                            self?.pokedexItemsMemento = self?.pokedexItems ?? []
                            self?.next = pokedex.next
                            self?.previous = pokedex.previous
                        } onError: { error in
                            print(error)
                        } onCompleted: {
                            if self?.pokedexItemsMemento.count == 120 {
                                self?.filterByPosition()
                            }
                        }.disposed(by: self?.disposeBag ?? DisposeBag())
                    }
                }
            }
        }, onError: { error in
            print(error)
        }).disposed(by: self.disposeBag)
    }

    func filterListByName(textToSearch: String) {
        pokedexItems = pokedexItemsMemento
        if textToSearch == "" {
            pokedexItems = pokedexItemsMemento
        } else {
            let filtered = pokedexItems.filter {
                ($0.name?.contains(textToSearch))!
            }
            pokedexItems = filtered
            print(pokedexItems.count)
        }
    }

    func filterByPosition() {
        let filtered = pokedexItemsMemento.sorted(by: { $0.position < $1.position })
        self.pokedexItemsMemento = filtered
        self.pokedexItems = filtered
    }
}
