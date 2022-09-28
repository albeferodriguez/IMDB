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
                            .foregroundColor(.black)

                        HStack {
                            if let list = pokemon.types {
                                ForEach(list) { type in
                                    Text(type.type?.name ?? "")
                                        .font(.caption)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(Color.gray)
                                        .cornerRadius(4)
                                }
                            }
                        }

                        VStack {
                            if let list = pokemon.stats {
                                ForEach(list) { stat in
                                    HStack(alignment: .lastTextBaseline) {
                                        Text(stat.stat?.name ?? "")
                                            .font(.body)
                                        Spacer()
                                        BarchartView(value: Double(stat.baseStat ?? Int(0.0)), width: 150, height: 10)
                                        Text("\(stat.baseStat ?? 0)")
                                            .font(.body)
                                    }//: HSTACK LIST
                                    .padding(.leading, 25)
                                    .padding(.trailing, 25)

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
            .background(Color.red)
        }//: SCROLLVIEW
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: PokemonEntity(id: UUID(), name: "asda", sprites: nil, types: nil, forms: nil))
    }
}
