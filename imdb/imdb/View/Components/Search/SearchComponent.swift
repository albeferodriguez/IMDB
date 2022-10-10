//
//  SearchComponent.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 9/10/22.
//

import SwiftUI

struct SearchComponent: View {

    @ObservedObject var presenter: PokedexPresenter

    var body: some View {
        ZStack {
            Rectangle()
                .stroke()
                .stroke(lineWidth: 2)
                .fill(.black)
                .cornerRadius(8)
                .frame(maxWidth: .infinity, maxHeight: 40)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            HStack {
                Image("search")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                TextField("Buscar pokemon por nombre", text: $presenter.textToFind)
            }
            .frame(maxWidth: .infinity, maxHeight: 40)
            .cornerRadius(4)
            .padding(.leading, 30)
            .padding(.trailing, 20)
        }
    }
}

struct SearchComponent_Previews: PreviewProvider {
    static var previews: some View {
        SearchComponent(presenter: PokedexPresenter())
    }
}
