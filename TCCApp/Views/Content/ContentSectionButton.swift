//
//  ContentSectionButton.swift
//  TCCApp
//
//  Created by Vitor Souza on 22/11/22.
//

import SwiftUI

struct ContentSectionButton: View {
    let label: String
    let section: ContentView.Section
    @Binding var currentSection: ContentView.Section
    let proxy: GeometryProxy
    
    init(
        label: String,
        updateCurrentSegment currentSection: Binding<ContentView.Section>,
        to section: ContentView.Section,
        withProxy proxy: GeometryProxy
    ) {
        self.label = label
        self.section = section
        self._currentSection = currentSection
        self.proxy = proxy
    }
    
    var body: some View {
        Button {
            currentSection = section
        } label: {
            Text(label)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .foregroundColor(currentSection == section ? Color.black : Color(token: .activeGreen))
        }
        .buttonStyle(.borderless)
        .frame(
            width: .width(288, in: proxy, min: 150),
            height: .height(48, in: proxy, min: 30)
        )
        .background(currentSection == section ? Color(token: .activeGreen) : Color.clear)
        .clipShape(Capsule())
        .background {
            Capsule()
                .stroke(Color(token: .activeGreen), lineWidth: 2.0)
        }
    }
}

struct ContentSectionButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
