//
//  PokemonCard.swift
//  Pokemon-6-Pack
//
//  Created by Артем Кривдин on 04.02.2023.
//

import SwiftUI

struct PokemonCard: View {
    var pokemon: Pokemon
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: pokemon.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(alignment: .bottom) {
                        Text("#\(pokemon.id) \(pokemon.name)")
                            .font(.caption)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 4, x: 0, y: 0)
                            .frame(maxWidth: 136)
                            .padding(3)
                    }
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(alignment: .bottom) {
                        Text("#\(pokemon.id) \(pokemon.name)")
                            .font(.caption)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 4, x: 0, y: 0)
                            .frame(maxWidth: 136)
                            .padding(3)
                    }
            }
        }
        .frame(width: 100, height: 100, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [Color(pokemon.type2), Color(pokemon.type1)]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
    }
}

struct PokemonCard_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCard(pokemon: Pokemon())
    }
}
