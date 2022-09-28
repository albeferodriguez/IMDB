//
//  PokemonRepository.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 27/9/22.
//

import RxSwift

protocol PokemonRepository {
    func getPokemon(url: String) -> Observable<Response<PokemonDTO>> 
}
