//
//  User.swift
//  TCCApp
//
//  Created by Vitor Gledison Oliveira de Souza on 23/11/22.
//

import Foundation
import struct SwiftUI.Color

struct User: Identifiable, Equatable {
    let id: UUID
    var firstName: String
    var lastName: String
    var color: Color
    var role: String
    let admissionDate: Date
    var writtenTopics: Int
    var topics: [String]
    
    internal init(
        id: UUID, fistName: String, lastName: String,
        color: Color, role: String,
        admissionDate admissionDateString: String?,
        writtenTopics: Int = 0, topics: [String] = []
    ) {
        let dateString = admissionDateString ?? ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let admissionDate: Date = dateFormatter.date(from: dateString) ?? .now
        
        self.init(
            id: id, fistName: fistName,
            lastName: lastName, color: color,
            role: role, admissionDate: admissionDate,
            writtenTopics: writtenTopics,
            topics: topics
        )
    }
    
    internal init(
        id: UUID, fistName: String, lastName: String,
        color: Color, role: String, admissionDate: Date,
        writtenTopics: Int = 0, topics: [String] = []
    ) {
        self.id = id
        self.firstName = fistName
        self.lastName = lastName
        self.color = color
        self.role = role
        self.admissionDate = admissionDate
        self.writtenTopics = writtenTopics
        self.topics = topics
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
    
    static let sample = [
        User(
            id: UUID(), fistName: "Vinicius",
            lastName: "Araujo", color: .blue,
            role: "iOS Dev Pleno",
            admissionDate: "12/03/2022",
            writtenTopics: 10,
            topics: ["Arquitetura", "Design Patterns", "Scrum", "ViewCode"]
        ),
        User(
            id: UUID(), fistName: "Douglas",
            lastName: "Henrique", color: .pink,
            role: "iOS Dev Pleno",
            admissionDate: "12/03/2022",
            writtenTopics: 9,
            topics: ["Arquitetura", "Design Patterns", "Scrum", "ViewCode"]
        ),
        User(
            id: UUID(), fistName: "Vitor",
            lastName: "Souza", color: .orange,
            role: "iOS Dev Pleno",
            admissionDate: "15/03/2022",
            writtenTopics: 7,
            topics: ["Arquitetura", "Design Patterns", "Scrum", "ViewCode"]
        ),
        User(
            id: UUID(), fistName: "Sérgio",
            lastName: "Ruediger", color: .yellow,
            role: "iOS Dev Pleno",
            admissionDate: "10/03/2022",
            writtenTopics: 4,
            topics: ["Arquitetura", "Design Patterns", "Scrum", "ViewCode"]
        ),
        User(
            id: UUID(), fistName: "Jessé",
            lastName: "Feitosa", color: .purple,
            role: "UI/UX Junior",
            admissionDate: "10/03/2022",
            writtenTopics: 10,
            topics: ["Arquitetura", "Design Patterns", "Scrum", "ViewCode"]
        ),
    ]
}
