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

        List {
            ForEach(presenter.getPokedexItems()) { items in
                SimpleList(name: items.name ?? "no sabe")
            }
        }
        
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
