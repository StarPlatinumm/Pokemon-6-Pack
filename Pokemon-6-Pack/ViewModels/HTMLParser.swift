//
//  HTMLParser.swift
//  Pokemon-6-Pack
//
//  Created by Артем Кривдин on 04.02.2023.
//

import Foundation
import SwiftSoup
import Alamofire

final class HTTPParser: ObservableObject {
    
    @Published var allPokemon: [Pokemon] = []
    
    init() {
        getPokemonData()
    }
    
    func getPokemonData() {
        guard let url = URL(string: "https://www.serebii.net/pokedex/001.shtml") else {
            print("Invalid URL")
            return
        }
        
        AF.request(url)
            .responseString { response in
                switch response.result {
                case .success(let html):
                    let doc: Document = try! SwiftSoup.parse(html)
                    let title = try! doc.select("title").first()!.ownText()
                    let stats = try! doc.getElementsMatchingOwnText("Base Stats - Total: *")[0].parents()[0]
//                    let type = try! doc.getElementsByAttributeValueMatching("src", "/pokedex-bw/type/.+")
                    
                    var pokemon = Pokemon()
                    pokemon.name = String(title.split(separator: " - ").last!)
                    pokemon.ttl = Int(stats.children()[0].ownText().suffix(3))!
                    pokemon.hp = Int(stats.children()[1].ownText())!
                    pokemon.attack = Int(stats.children()[2].ownText())!
                    pokemon.defence = Int(stats.children()[3].ownText())!
                    pokemon.special = Int(stats.children()[4].ownText())!
                    pokemon.speed = Int(stats.children()[5].ownText())!
                    self.allPokemon.append(pokemon)
                case .failure(let error):
                    print(error)
                }
            }
        
        return 
    }
}
