//
//  PokemonView.swift
//  Pokemon-6-Pack
//
//  Created by Артем Кривдин on 04.02.2023.
//

import SwiftUI

struct PokemonView: View {
    var pokemon: Pokemon
    
    var body: some View {
        ScrollView() {
            // picture
            AsyncImage(url: URL(string: pokemon.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color(pokemon.type2), Color(pokemon.type1)]), startPoint: .top, endPoint: .bottom))
            
            VStack(spacing: 30) {
                // name
                Text(pokemon.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                // typing
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .opacity(0.5)
                            .foregroundColor(.white)
                            .frame(width: 80)
                        Text("\(pokemon.type1)")
                            .foregroundColor(Color(pokemon.type1))
                    }
                    if pokemon.type1 != pokemon.type2 {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .opacity(0.5)
                                .foregroundColor(.white)
                                .frame(width: 80)
                            Text("\(pokemon.type2)")
                                .foregroundColor(Color(pokemon.type2))
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 30) {
                    // descriptions
                    Text("\(pokemon.description)")
                        .lineLimit(4)
                    // stats
                    GeometryReader { geometry in
                        VStack(alignment: .leading, spacing: 5) {
                            PokemonStatsBarView(statName: "HP", statPoints: pokemon.hp, statColor: .blue, proxy: geometry)
                            PokemonStatsBarView(statName: "Attack", statPoints: pokemon.attack, statColor: .red, proxy: geometry)
                            PokemonStatsBarView(statName: "Defence", statPoints: pokemon.defence, statColor: .yellow, proxy: geometry)
                            PokemonStatsBarView(statName: "Special", statPoints: pokemon.special, statColor: .green, proxy: geometry)
                            PokemonStatsBarView(statName: "Speed", statPoints: pokemon.speed, statColor: .pink, proxy: geometry)
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
            .background(LinearGradient(gradient: Gradient(colors: [.red, .red.opacity(0.3)]), startPoint: .top, endPoint: .bottom))
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon(name: "Bulbasaur", type1: "Grass", type2: "Electric", description: "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.", hp: 100, attack: 120, defence: 90, special: 130, speed: 200))
    }
}
