//
//  GetPokedexUseCase.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 26/9/22.
//

import RxSwift

class GetPokedexUseCase {

    let service: PokedexRepository

    init (service: PokedexRepository) {
        self.service = service
    }

    func getPokedex() -> Observable<PokedexEntity> {
        return self.service.getPokedex(limit: 10000, offset: 0)
            .map { data -> PokedexEntity in

                if data.statusCode == 200, let pokedex = data.body {
                    return PokedexEntity(id: pokedex.id, count: pokedex.count, next: pokedex.next, previous: pokedex.previous, results: pokedex.results)
                }

                return PokedexEntity(id: UUID())
            }
    }
}
