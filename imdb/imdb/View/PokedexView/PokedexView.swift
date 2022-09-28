//
//  PokedexView.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 26/9/22.
//

import SwiftUI

struct PokedexView: View {

    @StateObject var presenter = PokedexPresenter()

    var body: some View {
        NavigationView {
            VStack {
                Image("icn_pokemon_logo")
                    .resizable()
                    .frame(width: 240, height: 90)
                    .padding()
                PokedexItemList(pokedexList: presenter.pokedexItems)
            }.onAppear {
                presenter.getPokedex()
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
