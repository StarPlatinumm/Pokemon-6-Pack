//
//  Pokemon_6_PackApp.swift
//  Pokemon-6-Pack
//
//  Created by Артем Кривдин on 04.02.2023.
//

import SwiftUI

@main
struct Pokemon_6_PackApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(PokemonLocalViewModel())
        }
    }
}
