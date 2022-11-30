//
//  DefaultButton.swift
//  TCCApp
//
//  Created by Vitor Souza on 23/11/22.
//

import SwiftUI

struct DefaultButton: View {
    private let localizedTitle: LocalizedStringKey
    private let proxy: GeometryProxy
    private let action: () -> Void
    
    init(title: String, proxy: GeometryProxy, action: @escaping () -> Void = { }) {
        self.init(title: LocalizedStringKey(title), proxy: proxy, action: action)
    }
    
    init(title: LocalizedStringKey, proxy: GeometryProxy, action: @escaping () -> Void = { }) {
        self.localizedTitle = title
        self.proxy = proxy
        self.action = action
    }
    
    var body: some View {
        Button(
            action: action,
            label: {
                Text(localizedTitle)
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
