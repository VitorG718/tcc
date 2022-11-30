//
//  View+Border.swift
//  TCCApp
//
//  Created by Vitor Souza on 30/11/22.
//

import SwiftUI

extension View {
    func border(color: Color, lineWidth: CGFloat = 1.0, cornerRadius: CGFloat = 0) -> some View {
        self
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(color, lineWidth: lineWidth)
            )
    }
}
