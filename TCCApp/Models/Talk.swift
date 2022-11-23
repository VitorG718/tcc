//
//  Talk.swift
//  TCCApp
//
//  Created by Vitor Souza on 23/11/22.
//

import Foundation

struct Talk: Identifiable, Equatable {
    enum Status {
        case closed
        case opened
    }
    
    let id: UUID
    let status: Talk.Status
    let name: String
    let autores: [String]
    let lastUpdate: Date
    
    static func == (lhs: Talk, rhs: Talk) -> Bool {
        return lhs.id == rhs.id
    }
    
    static let sample = [
        Talk(
            id: UUID(), status: .opened,
            name: "Nome do projeto",
            autores: ["Jessé", "Vinicius", "Vitor", "Sérgio", "Douglas"],
            lastUpdate: .now.addingTimeInterval(-800_000)
        ),
        Talk(
            id: UUID(), status: .opened,
            name: "Depedências",
            autores: ["Vinicius", "Vitor", "Sérgio", "Douglas"],
            lastUpdate: .now.addingTimeInterval(-1_800_000)
        ),
        Talk(
            id: UUID(), status: .closed,
            name: "Tópico 1",
            autores: ["Jessé", "Vitor", "Sérgio", "Douglas"],
            lastUpdate: .now.addingTimeInterval(-1_304_033)
        ),
        Talk(
            id: UUID(), status: .closed,
            name: "Tópico 2",
            autores: ["Jessé", "Douglas"],
            lastUpdate: .now.addingTimeInterval(-2_540_030)
        ),
        Talk(
            id: UUID(), status: .closed,
            name: "Tópico 3",
            autores: ["Sérgio", "Douglas"],
            lastUpdate: .now.addingTimeInterval(-3_200_200)
        ),
        Talk(
            id: UUID(), status: .closed,
            name: "Tópico 4",
            autores: ["Vitor", "Sérgio", "Douglas"],
            lastUpdate: .now.addingTimeInterval(-4_500_000)
        ),
        Talk(
            id: UUID(), status: .closed,
            name: "Tópico 5",
            autores: ["Jessé", "Vinicius", "Douglas"],
            lastUpdate: .now.addingTimeInterval(-1_900_000)
        ),
        Talk(
            id: UUID(), status: .closed,
            name: "Tópico 6",
            autores: ["Jessé", "Sérgio", "Douglas"],
            lastUpdate: .now.addingTimeInterval(-16_203_330)
        ),
        Talk(
            id: UUID(), status: .closed,
            name: "Tópico 7",
            autores: ["Jessé", "Vinicius", "Vitor"],
            lastUpdate: .now.addingTimeInterval(-13_240_300)
        ),
    ]
}
