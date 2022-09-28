//
//  PokedexItemList.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 26/9/22.
//

import SwiftUI
import Kingfisher
import SVGKit

struct SVGImageView: UIViewRepresentable {
    var url:URL
    var size:CGSize

    func updateUIView(_ uiView: SVGKFastImageView, context: Context) {
        uiView.contentMode = .scaleAspectFill
        uiView.image.size = size
    }

    func makeUIView(context: Context) -> SVGKFastImageView {
        let svgImage = SVGKImage(contentsOf: url)
        return SVGKFastImageView(svgkImage: svgImage ?? SVGKImage())
    }
}

struct PokedexItemList: View {

    var pokedexList: [PokemonEntity]
    @ObservedObject var presenter = PokedexPresenter()

    let columns = [
            GridItem(.fixed(120), spacing: 60),
            GridItem(.fixed(120), spacing: 60)
        ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                if let list = pokedexList {
                    ForEach(list) { pokemon in
                        VStack {
                            if let url = pokemon.sprites?.other?.dreamWorld?.frontImage, let name = pokemon.name {
                                SVGImageView(url:URL(string: url)!, size: CGSize(width: 90,height: 90))
                                Text(name)
                            } //: IF LET
                        }//: VSTACK
                        .frame(width: 120, height: 120)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(8)
                    }//: FOR EACH
                }//: IF LET
            }//: LAZYVGRID
        }//: SCROLLVIEW

    }
}

struct PokedexItemList_Previews: PreviewProvider {
    static var previews: some View {
        PokedexItemList(pokedexList: [PokemonEntity(id: UUID(), name: "bulbasaur", sprites: nil, types: nil, forms: nil)])
    }
}
