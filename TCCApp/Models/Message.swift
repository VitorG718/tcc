//
//  Message.swift
//  TCCApp
//
//  Created by Vitor Souza on 30/11/22.
//

import Foundation

struct Message: Identifiable, Equatable, Hashable {
    let id = UUID()
    let content: String
    let author: User
    let likes: [User]
    let media: MessageMedia?
    
    static func ==(lhs: Message, rhs: Message) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static let sample: [Message] = [
        Message(
            content: "mensagem escrita por usuário sobre algo relevante para o tópico desejado",
            author: User.sample[0],
            likes: [
                User.sample[1],
                User.sample[3],
            ],
            media: nil
        ),
        Message(
            content: "Achei esse video muito bom e explicativo",
            author: User.sample[1],
            likes: [
                User.sample[0],
                User.sample[2]
            ],
            media: MessageMedia(content: "Titulo do video")
        ),
    ]
}
