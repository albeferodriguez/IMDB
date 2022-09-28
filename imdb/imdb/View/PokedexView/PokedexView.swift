//
//  PokedexView.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 26/9/22.
//

import SwiftUI

struct SimpleList: View {

    var name: String

    var body: some View {

        HStack {
            Text(name)
        }.padding(20)
            .cornerRadius(4)
            .background(Color.red)
    }
}

struct PokedexView: View {

    @StateObject var presenter = PokedexPresenter()

    var body: some View {
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
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
