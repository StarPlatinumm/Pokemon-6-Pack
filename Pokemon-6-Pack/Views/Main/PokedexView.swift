//
//  PokedexView.swift
//  Pokemon-6-Pack
//
//  Created by Артем Кривдин on 04.02.2023.
//

import SwiftUI

struct PokedexView: View {
    @EnvironmentObject var pokemonVM: PokemonLocalViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                PokedexList(allPokemon: pokemonVM.allPokemon)
            }
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
            .environmentObject(PokemonLocalViewModel())
    }
}
