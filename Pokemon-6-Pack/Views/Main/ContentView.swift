//
//  ContentView.swift
//  Pokemon-6-Pack
//
//  Created by Артем Кривдин on 04.02.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var pokemonVM: PokemonLocalViewModel
    
    var body: some View {
        TabBar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PokemonLocalViewModel())
    }
}
