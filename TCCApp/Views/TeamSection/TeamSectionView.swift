//
//  TeamSectionView.swift
//  TCCApp
//
//  Created by Vitor Souza on 22/11/22.
//

import SwiftUI

struct TeamSectionView: View {
    let proxy: GeometryProxy
    
    var body: some View {
        Color.purple
    }
}

struct TeamSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(currentSection: .team)
            .frame(width: 1080, height: 675)
    }
}
