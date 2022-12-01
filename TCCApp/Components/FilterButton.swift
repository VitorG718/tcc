//
//  FilterButton.swift
//  TCCApp
//
//  Created by Vitor Souza on 23/11/22.
//

import SwiftUI

struct FilterButton<T: Filter>: View {
    let filter: T
    let proxy: GeometryProxy
    var handler: (_ filter: T, _ selected: Bool) -> Void = { (_, _) in }
    @State private var selected = false
    
    var body: some View {
        Button(
            action: {
                selected.toggle()
                handler(filter, selected)
            },
            label: {
                Text(filter.name.uppercased())
                    .font(.system(
                        size: .height(24, in: proxy, min: 12),
                        weight: .regular
                    ))
                    .foregroundColor(.white)
                    .padding(.vertical, .height(10, in: proxy, min: 5))
                    .padding(.horizontal, .width(15, in: proxy, min: 7))
            }
        )
        .buttonStyle(.borderless)
        .background(Color(token: .backgroundPrimary))
        .clipShape(Capsule())
        .overlay(Capsule().stroke(Color.gray, lineWidth: 2.0))
        .colorMultiply(selected ? Color(token: .activeGreen) : .white)
    }
}
