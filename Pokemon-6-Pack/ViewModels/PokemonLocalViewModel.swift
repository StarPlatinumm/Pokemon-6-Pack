//
//  PokemonLocalViewModel.swift
//  Pokemon-6-Pack
//
//  Created by Артем Кривдин on 04.02.2023.
//

import Foundation

class PokemonLocalViewModel: ObservableObject {
    @Published private(set) var allPokemon: [Pokemon] = []
    
    init() {
        let filePath = Bundle.main.path(forResource: "pokemon_db", ofType: "json")!
        let json = try! String(contentsOfFile: filePath).data(using: .utf8)!
        allPokemon = try! JSONDecoder().decode([Pokemon].self, from: json)
        allPokemon.sort(by: { $0.id < $1.id })
    }
    
    func getGradientColor() {
        
    }
}
