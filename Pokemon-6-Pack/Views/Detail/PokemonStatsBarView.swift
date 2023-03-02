//
//  PokemonStatsBarView.swift
//  Pokemon-6-Pack
//
//  Created by Артем Кривдин on 26.02.2023.
//

import SwiftUI

struct PokemonStatsBarView: View {
    let statName: String
    let statPoints: Int
    let statColor: Color
    let proxy: GeometryProxy
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text("\(statName): \(statPoints)")
            RoundedRectangle(cornerRadius: 3)
                .opacity(0.3)
                .foregroundColor(statColor)
                .frame(width: CGFloat(proxy.size.width) / 250.0 * CGFloat(statPoints))
        }
    }
}
