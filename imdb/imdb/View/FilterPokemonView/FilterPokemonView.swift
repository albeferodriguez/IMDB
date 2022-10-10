//
//  FilterPokemonView.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 8/10/22.
//

import SwiftUI

struct FilterPokemonView: View {

    @EnvironmentObject var presenter: PokedexPresenter

    var body: some View {
        NavigationView {
            VStack {
                SearchComponent(presenter: presenter)
                ScrollView(showsIndicators: false) {
                    PokedexItemList(pokedexList: presenter.pokedexItems)
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

