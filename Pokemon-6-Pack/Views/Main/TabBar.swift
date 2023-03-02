//
//  TabBar.swift
//  Pokemon-6-Pack
//
//  Created by Артем Кривдин on 04.02.2023.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            TeamView()
                .tabItem {
                    Label("My Team", systemImage: "heart")
                }
            
            PokedexView()
                .tabItem {
                    Label("Pokedex", systemImage: "magnifyingglass")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(PokemonLocalViewModel())
    }
}
