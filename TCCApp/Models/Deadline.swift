//
//  Deadline.swift
//  TCCApp
//
//  Created by Vitor Souza on 23/11/22.
//

import Foundation
import struct SwiftUI.Color

struct Deadline: Identifiable {
    var id: UUID
    let endDate: Date
    let category: String
    let content: String
    let color: Color
    
    static let sample = [
        Deadline(
            id: UUID(),
            endDate: .now.addingTimeInterval(500_000),
            category: "Entrega",
            content: "1º Submissão na App Store",
            color: .yellow
        ),
        Deadline(
            id: UUID(),
            endDate: .now.addingTimeInterval(1_000_000),
            category: "Scrum",
            content: "4º Sprint Review",
            color: .red
        ),
        Deadline(
            id: UUID(),
            endDate: .now.addingTimeInterval(1_750_000),
            category: "Scrum",
            content: "Alinhamento de Equipe",
            color: .green
        ),
        Deadline(
            id: UUID(),
            endDate: .now.addingTimeInterval(1_800_000),
            category: "Scrum",
            content: "Planning",
            color: .yellow
        ),
        Deadline(
            id: UUID(),
            endDate: .now.addingTimeInterval(2_800_000),
            category: "Entrega",
            content: "Submissão do TestFlight",
            color: .yellow
        ),
        Deadline(
            id: UUID(),
            endDate: .now.addingTimeInterval(3_800_000),
            category: "Entrega",
            content: "Versão para App Store",
            color: .yellow
        ),
    ]
}
