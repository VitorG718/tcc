//
//  Color+Token.swift
//  TCCApp
//
//  Created by Vitor Souza on 22/11/22.
//

import SwiftUI

public extension Color {
    init(token: DesignTokens.Colors) {
        self = Color(token.rawValue)
    }
}
