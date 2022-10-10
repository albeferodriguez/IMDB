//
//  PokedexView.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 26/9/22.
//

import SwiftUI

struct PokedexView: View {

    @EnvironmentObject var presenter: PokedexPresenter
    @State var count = 0

    var body: some View {
        NavigationView {
            VStack {
                Image("icn_pokemon_logo")
                    .resizable()
                    .frame(width: 240, height: 90)
                    .padding()
                ScrollView(showsIndicators: false) {
                    //LoaderComponent(isVisible: $isVisible)
                    PokedexItemList(pokedexList: presenter.pokedexItems)
                }.onAppear {
                    if count == 0 {
                        presenter.getPokedex()
                        count += 1
                    }
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }

    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
