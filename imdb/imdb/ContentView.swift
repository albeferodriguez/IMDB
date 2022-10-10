//
//  ContentView.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 19/9/22.
//

import SwiftUI

struct ContentView: View {

    @StateObject var presenter = PokedexPresenter()

    var body: some View {
        
        TabView {
            PokedexView()
                .tabItem {
                    VStack {
                        Image("pokedex")
                            .resizable()
                            .frame(width: 8, height: 8)
                            .aspectRatio(contentMode: .fit)
                        Text("Pokedex")
                    }
                }
                .padding()
                .environmentObject(presenter)

            FilterPokemonView()
                .tabItem {
                    VStack {
                        Image("search")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text("Search")
                    }
                }
                .padding()
                .environmentObject(presenter)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
