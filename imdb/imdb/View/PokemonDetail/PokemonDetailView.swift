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
                    if let url = pokemon.sprites?.other?.artWork?.frontImage {
                        KFImage(URL(string: url))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }//: IF LET

                    VStack {
                        Text(pokemon.name ?? "unkown")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(pokemon.types?[0].color)

                        HStack {
                            if let list = pokemon.types {
                                ForEach(list) { type in
                                    Text(type.name?.capitalizingFirstLetter() ?? "")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .padding()
                                        .background(type.color)
                                        .cornerRadius(4)
                                }
                            }
                        }

                        VStack {
                            if let list = pokemon.stats {
                                ForEach(list) { stat in
                                    HStack(alignment: .firstTextBaseline) {
                                        Text(stat.stat?.name?.capitalizingFirstLetter() ?? "")
                                            .font(.footnote)
                                            .frame(width: 60)
                                            .multilineTextAlignment(.leading)

                                        Spacer()
                                        BarchartView(value: Double(stat.baseStat ?? Int(0.0)), width: 180, height: 10, color: pokemon.types?[0].color ?? .red)
                                            .padding(.trailing, 20)

                                        Text("\(stat.baseStat ?? 0)")
                                            .font(.body)
                                            .frame(width: 40)
                                            .padding(.trailing, 10)
                                    }//: HSTACK LIST
                                    .padding(.leading, 10)
                                    .padding(.trailing, 15)

                                    Divider()
                                        .frame(width: 150, height: 1)
                                        .foregroundColor(Color.gray)
                                }//: FOREACH LIST
                            }
                        }
                        .frame(height: 300)
                        Spacer()
                    }//: VSTACK DETAIL
                    .frame(maxWidth: .infinity)
                    .background(
                        Color.white
                            .clipShape(AKCurvedViewShape(curveOffset: 75, side: .top))
                            .edgesIgnoringSafeArea(.bottom)
                    )
                }//: VSTACK PKMN
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            }//: ZSTACK
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(pokemon.types?[0].color)
            .navigationBarTitle("")
            .ignoresSafeArea(.container, edges: .top)
        }//: SCROLLVIEW
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: PokemonEntity(id: UUID(), name: "asda", sprites: nil, types: nil, forms: nil))
    }
}
