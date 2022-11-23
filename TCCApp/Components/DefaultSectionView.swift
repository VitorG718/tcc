//
//  DefaultSectionView.swift
//  TCCApp
//
//  Created by Vitor Souza on 22/11/22.
//

import SwiftUI

struct DefaultSectionView<First: View, Second: View>: View {
    let proxy: GeometryProxy
    let firstSection: () -> First
    let secondSection: () -> Second
    
    var body: some View {
        HStack(spacing: .zero) {
            Color.clear
                .overlay(content: firstSection)
                .frame(width: .width(605, in: proxy, min: 300))
            
            Color.clear
                .overlay(content: secondSection)
                .frame(maxWidth: .infinity)
                .padding(.leading, .width(66, in: proxy, min: 15))
        }
    }
}

extension DefaultSectionView where First == EmptyView, Second == EmptyView {
    @ViewBuilder
    static func createHeader(
        _ title: String,
        toButtonTitle buttonLabel: String,
        with proxy: GeometryProxy,
        handler: @escaping () -> Void = { }
    ) -> some View {
        HStack(spacing: .zero) {
            Text(title)
                .font(.system(
                    size: .height(32, in: proxy, min: 20),
                    weight: .medium
                ))
                .foregroundColor(.white)
            
            Spacer()
            
            DefaultButton(title: buttonLabel, proxy: proxy, action: handler)
        }
    }
}
