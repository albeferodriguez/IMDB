//
//  PokedexService.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 26/9/22.
//

import RxSwift

class PokedexService: PokedexRepository {

    func getPokedex(url: String? = nil, parameters: [String : Int]) -> Observable<Response<PokedexDTO>> {
        let service = NetworkingClient<PokedexDTO>(url: URL(string: url ?? "https://pokeapi.co/api/v2/pokemon")!, method: .get, parameters: parameters, isBody: false)

        return service.execute()
    }
}
