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
        let service = NetworkingClient<PokedexDTO>(url: "https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0", method: .get, parameters: nil, isBody: true)

        return service.execute()
    }
}
