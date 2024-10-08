//
//  ToDoItem.swift
//  ToDo
//
//  Created by 홍석현 on 9/12/24.
//


import Foundation

struct ToDoItem: Equatable, Codable {
    let id: UUID
    let title: String
    let description: String?
    let timeStamp: Double?
    let location: Location?
    var done = false
    
    init(
        title: String,
        description: String? = nil,
        timeStamp: Double? = nil,
        location: Location? = nil
    ) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.timeStamp = timeStamp
        self.location = location
    }
    
    static func == (lhs: ToDoItem, rhs: ToDoItem) -> Bool {
        return lhs.id == rhs.id
    }
}

extension ToDoItem: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
