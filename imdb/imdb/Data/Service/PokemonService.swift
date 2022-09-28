//
//  PokemonService.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 27/9/22.
//

import Foundation
import RxSwift

class PokemonService: PokemonRepository {

    var url: String

    init(url: String) {
        self.url = url
    }

    func getPokemon(url: String) -> Observable<Response<PokemonDTO>> {
        let service = NetworkingClient<PokemonDTO>(url: url, method: .get, isBody: false)
        return service.execute()
    }

}
