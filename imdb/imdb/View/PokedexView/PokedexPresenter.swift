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
    var disposeBag = DisposeBag()
    var pokedexItems: [PokemonPokedexEntity]?

    func getPokedex() {
        _ = pokedexUseCase.getPokedex().subscribe(onNext: { [weak self] pokedex in
            print(dump(pokedex))
            self?.pokedexItems = pokedex.results
        }, onError: { error in
            print(error)
        }).disposed(by: self.disposeBag)
    }


    func getPokedexItems() -> [PokemonPokedexEntity] {
        getPokedex()
        if let pokedexItems = pokedexItems {
            return pokedexItems
        }
        return []
    }
}
