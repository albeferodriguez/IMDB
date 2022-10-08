//
//  PokedexView.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 26/9/22.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {

    typealias UIView = UIActivityIndicatorView
    var isAnimating: Bool
    fileprivate var configuration = { (indicator: UIView) in }

    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIView { UIView() }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Self>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
        configuration(uiView)
    }
}

struct PokedexView: View {

    @StateObject var presenter = PokedexPresenter()

    var body: some View {
        NavigationView {
            VStack {
                Image("icn_pokemon_logo")
                    .resizable()
                    .frame(width: 240, height: 90)
                    .padding()
                ScrollView(showsIndicators: false) {
                    PokedexItemList(pokedexList: presenter.pokedexItems)
                }.onAppear {
                    presenter.getPokedex()
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
