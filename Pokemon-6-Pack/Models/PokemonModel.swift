//
//  PokemonModel.swift
//  Pokemon-6-Pack
//
//  Created by Артем Кривдин on 04.02.2023.
//

import Foundation

enum Typing: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case bug = "Bug"
    case dragon = "Dragon"
    case electric = "Electric"
    case fairy = "Fairy"
    case fighting = "Fighting"
    case fire = "Fire"
    case ghost = "Ghost"
    case grass = "Grass"
    case ground = "Ground"
    case ice = "Ice"
    case normal = "Normal"
    case posion = "Posion"
    case psychic = "Psychic"
    case rock = "Rock"
    case water = "Water"
    case none = ""
}

struct Pokemon: Identifiable, Decodable {
    var id: Int
    var name: String
    var type1: Typing.RawValue
    var type2: Typing.RawValue
    var description: String
    var ttl: Int
    var hp: Int
    var attack: Int
    var defence: Int
    var special: Int
    var speed: Int
    var image: String {
        "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/\(String(format: "%03d", id)).png"
    }
    
    init(id: Int = 1, name: String = "", type1: Typing.RawValue = "", type2: Typing.RawValue = "", description: String = "", ttl: Int = 0, hp: Int = 0, attack: Int = 0, defence: Int = 0, special: Int = 0, speed: Int = 0) {
        self.id = id
        self.name = name
        self.type1 = type1
        self.type2 = type2 == "" ? type1 : type2
        self.description = description
        self.ttl = ttl
        self.hp = hp
        self.attack = attack
        self.defence = defence
        self.special = special
        self.speed = speed
    }
}
