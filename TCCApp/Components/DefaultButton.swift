//
//  DefaultButton.swift
//  TCCApp
//
//  Created by Vitor Souza on 23/11/22.
//

import SwiftUI

struct DefaultButton: View {
    let title: String
    let proxy: GeometryProxy
    var action: () -> Void = { }
    
    var body: some View {
        Button(
            action: action,
            label: {
                Text(title)
                    .font(.system(
                        size: .height(24, in: proxy, min: 13),
                        weight: .regular
                    ))
                    .foregroundColor(.white)
                    .padding(.horizontal, .width(30, in: proxy, min: 18))
                    .padding(.vertical, .height(10, in: proxy, min: 6))
            }
        )
        .buttonStyle(.borderless)
        .background(Color(token: .backgroundPrimary))
        .clipShape(Capsule())
        .overlay(Capsule().stroke(Color.gray, lineWidth: 2.0))
    }
}
