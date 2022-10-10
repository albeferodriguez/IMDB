//
//  PokemonDetailView.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 28/9/22.
//

import SwiftUI
import Kingfisher

struct PokemonDetailView: View {

    var pokemon: PokemonEntity

    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack {
                VStack {
                    ZStack {
                        if let url = pokemon.sprites?.other?.artWork?.frontImage {
                            KFImage(URL(string: url))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                        }//: IF LET
                    }.background(
                        pokemon.types?[0].color
                            .clipShape(Circle())
                            .frame(width: 250, height: 250, alignment: .top)
                            .edgesIgnoringSafeArea(.bottom)
                    )

                    VStack(alignment: .leading) {
                        Text("No.\(pokemon.position)")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
                        Text(pokemon.name ?? "unkown")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)

                        VStack {
                            ItemWithText(icon: "flame", typeName: "Type", itemText: pokemon.typesConcatenated ?? "")
                            ItemWithText(icon: "person", typeName: "Weight", itemText: "\(String(pokemon.weight ?? 0)) kg")
                            ItemWithText(icon: "person", typeName: "Height", itemText: "\(String(pokemon.height ?? 0)) m")
                            ItemWithText(icon: "person", typeName: "Height", itemText: "\(String(pokemon.height ?? 0)) m")
                            ItemWithText(icon: "person", typeName: "Height", itemText: "\(String(pokemon.height ?? 0)) m")
                            ItemWithText(icon: "person", typeName: "Height", itemText: "\(String(pokemon.height ?? 0)) m")
                        }
                    }//: VSTACK DETAIL
                    .frame(maxWidth: .infinity)
                    .padding(.top, 20)
                }//: VSTACK PKMN
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            }//: ZSTACK
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarTitle("")
            .padding(.bottom, 30)
            .ignoresSafeArea(.container, edges: .top)
        }//: SCROLLVIEW
        .ignoresSafeArea()
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: PokemonEntity(id: UUID(), position: 1, name: "asda", sprites: nil, types: nil, forms: nil))
    }
}
