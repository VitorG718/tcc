//
//  Filter.swift
//  TCCApp
//
//  Created by Vitor Souza on 30/11/22.
//

import Foundation

protocol Filter: Identifiable {
    var id: UUID { get }
    var name: String { get }
}
