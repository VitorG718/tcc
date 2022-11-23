//
//  UserButton.swift
//  TCCApp
//
//  Created by Vitor Souza on 22/11/22.
//

import SwiftUI

struct UserButton: View {
    @State private var height: CGFloat = 0.0
    let proxy: GeometryProxy
    
    var body: some View {
        HStack(
            alignment: .center,
            spacing: .width(34, in: proxy, min: 17)
        ) {
            VStack(alignment: .leading, spacing: .zero) {
                Text("cargo")
                    .font(.system(
                        size: .height(20, in: proxy, min: 12),
                        weight: .regular
                    ))
                    .foregroundColor(.white)
                
                Text("UI/UX Junior")
                    .font(.system(
                        size: .height(32, in: proxy, min: 19.2),
                        weight: .medium
                    ))
                    .foregroundColor(.white)
            }
            
            HStack(alignment: .center, spacing: .zero) {
                let circleSize = height * 0.75
                Circle()
                    .fill(Color.white)
                    .frame(width: circleSize, height: circleSize)
                    .padding(.leading, .width(16, in: proxy, min: 10))
                
                Text("Jessé")
                    .font(.system(
                        size: .height(40, in: proxy, min: 25),
                        weight: .medium
                    ))
                    .foregroundColor(.white)
                    .padding(.leading, .width(12, in: proxy, min: 8))
                    .padding(.trailing, 6)
               
                let rectSize = height * 0.2
                Rectangle()
                    .fill(Color.white)
                    .frame(width: rectSize, height: rectSize)
                    .padding(.trailing, .width(25, in: proxy, min: 15))
            }
            .frame(maxHeight: .infinity)
            .background {
                GeometryReader { metrics -> Color in
                    Task { @MainActor in
                        height = metrics.size.height
                    }
                    return Color(token: .backgroundPrimary)
                }
            }
            .clipShape(Capsule())
            
        }
        .frame(height: .height(66, in: proxy, min: 55))
    }
}
