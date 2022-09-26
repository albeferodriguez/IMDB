//
//  PokedexService.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 26/9/22.
//

import RxSwift

class PokedexService: PokedexRepository {

    func getPokedex(limit: Int, offset: Int) -> Observable<Response<PokedexDTO>> {
        let parameters: [String : Int] = [
            "limit" : limit,
            "offset" : offset
        ]
        let service = NetworkingClient<PokedexDTO>(url: "https://pokeapi.co/api/v2/pokemon", method: .get, parameters: parameters, isBody: true)

        return service.execute()
    }
}
