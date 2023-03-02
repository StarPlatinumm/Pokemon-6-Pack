//
//  PokedexList.swift
//  Pokemon-6-Pack
//
//  Created by Артем Кривдин on 04.02.2023.
//

import SwiftUI

struct PokedexList: View {
    var allPokemon: [Pokemon]
    
    var body: some View {
        VStack {
            HStack {
                Text("\(allPokemon.count) pokemon")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                
                Spacer()
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 1)]) {
                ForEach(allPokemon.sorted(by: { $0.id < $1.id })) { pokemon in
                    NavigationLink(destination: PokemonView(pokemon: pokemon)) {
                        PokemonCard(pokemon: pokemon)
                    }
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct PokedexList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            PokedexList(allPokemon: [Pokemon()])
        }
    }
}
