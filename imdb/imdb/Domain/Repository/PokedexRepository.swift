//
//  PokedexRepository.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 26/9/22.
//

import RxSwift

protocol PokedexRepository {
    func getPokedex(url: String?, parameters: [String : Int]) -> Observable<Response<PokedexDTO>> 
}
