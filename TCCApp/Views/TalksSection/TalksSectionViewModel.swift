//
//  TalksSectionViewModel.swift
//  TCCApp
//
//  Created by Vitor Souza on 23/11/22.
//

import Foundation

class TalksSectionViewModel: ObservableObject {
    private let allTalks: [Talk]
    private var filteredTalks: [Talk]
    @Published private(set) var talks: [Talk]
    private var filters: [DeadlineFilter] = [DeadlineFilter]()
    @Published var currentTalk: Talk? = nil
    @Published var searchText: String = "" {
        didSet { filterBySearchText() }
    }
    @Published var chatText: String = ""
    private(set) var messages: [Message]
    
    init() {
        let allTalks = Talk.sample
        self.allTalks = allTalks
        self.filteredTalks = allTalks
        self.talks = allTalks
        self.messages = Message.sample
    }
    
    func removeFilter(_ filter: DeadlineFilter) {
        if let index = filters.firstIndex(of: filter) {
            filters.remove(at: index)
        }
        filterTalks()
    }
    
    func addFilter(_ filter: DeadlineFilter) {
        if !filters.contains(filter) {
            filters.append(filter)
        }
        filterTalks()
    }
    
    private func filterTalks() {
        let statusToFilter = filters.map(\.talkStatus)
        if statusToFilter.isEmpty && searchText.count < 3 {
            filteredTalks = allTalks
        } else {
            filteredTalks = allTalks.filter({ statusToFilter.contains($0.status) })
        }
        filterBySearchText()
    }
    
    private func filterBySearchText() {
        if searchText.count >= 3 {
            talks = filteredTalks.filter({ $0.name.contains(searchText) })
        } else {
            talks = filteredTalks
        }
    }
    
    func sendMessage() {
        guard !chatText.isEmpty else { return }
        let newMessage = Message(content: chatText, author: User.sample[4], likes: [], media: nil)
        messages.append(newMessage)
        chatText = ""
    }
}
