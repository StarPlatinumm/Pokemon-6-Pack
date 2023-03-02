//
//  PokemonViewModel.swift
//  Pokemon-6-Pack
//
//  Created by Артем Кривдин on 04.02.2023.
//
// Replaced with local data (json)

import Foundation
import SwiftSoup
import Alamofire

class PokemonViewModel: ObservableObject {
    @Published private(set) var allPokemon: [Pokemon] = []
    @Published private(set) var isDataLoading: Bool = true
    
    let maxAmount: Int = 15

    
    init() {
        isDataLoading = getPokemonData()
        allPokemon.sort(by: { $0.id < $1.id })
        let filePath = Bundle.main.path(forResource: "pokemon_db", ofType: "json")!
        let text = try! String(contentsOfFile: filePath)
        print(text)
        
    }
    
    func getPokemonData() -> Bool {
        for id in 1...self.maxAmount {
            guard let url1 = URL(string: "https://www.serebii.net/pokedex/\(String(format: "%03d", id)).shtml") else {
                print("Invalid URL: https://www.serebii.net/pokedex/\(String(format: "%03d", id)).shtml")
                return false
            }

            AF.request(url1)
                .responseString { response in
                    switch response.result {
                    case .success(let html):
                        let doc: Document = try! SwiftSoup.parse(html)
                        let title = try! doc.select("title").first()!.ownText()
                        let stats = try! doc.getElementsMatchingOwnText("Base Stats - Total: *")[0].parents()[0]
                        
                        var pokemon = Pokemon()
                        pokemon.id = id
                        pokemon.name = String(title.split(separator: " - ").last!)
                        pokemon.ttl = Int(stats.children()[0].ownText().suffix(3))!
                        pokemon.hp = Int(stats.children()[1].ownText())!
                        pokemon.attack = Int(stats.children()[2].ownText())!
                        pokemon.defence = Int(stats.children()[3].ownText())!
                        pokemon.special = Int(stats.children()[4].ownText())!
                        pokemon.speed = Int(stats.children()[5].ownText())!
                        
                        guard let url2 = URL(string: "https://www.pokemon.com/ru/pokedex/\(pokemon.name.lowercased())") else {
                            print("Invalid URL: https://www.pokemon.com/ru/pokedex/\(pokemon.name.lowercased())")
                            self.allPokemon.append(pokemon)
                            return
                        }
                        
                        AF.request(url2)
                            .responseString { response in
                                switch response.result {
                                case .success(let html):
                                    let doc: Document = try! SwiftSoup.parse(html)
                                    let types = try! doc.getElementsByAttributeValueMatching("href", ".+pokedex\\/\\?type=.+")
                                    pokemon.type1 = types.count > 0 ? types[0].ownText() : ""
                                    pokemon.type2 = types.count == 2 ? types[1].ownText() : ""
                                    self.allPokemon.append(pokemon)
                                    //print(pokemon)
                                case .failure(let error):
                                    print(error)
                                }
                            }
                        
                    case .failure(let error):
                        print(error)
                    }
                }
            
            
        }
        return false
    }
}
