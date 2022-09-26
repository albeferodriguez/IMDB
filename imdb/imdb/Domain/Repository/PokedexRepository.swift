//
//  PokedexRepository.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 26/9/22.
//

import RxSwift

protocol PokedexRepository {
    func getPokedex(limit: Int, offset: Int) -> Observable<Response<PokedexDTO>> 
}
