//
//  ToDoItem.swift
//  ToDo
//
//  Created by 홍석현 on 9/12/24.
//


import Foundation

struct ToDoItem: Equatable {
    let title: String
    let description: String?
    let timeStamp: Double
    let location: Location?
    var done = false
    
    init(
        title: String,
        description: String? = nil,
        timeStamp: Double? = nil,
        location: Location? = nil
    ) {
        self.title = title
        self.description = description
        self.timeStamp = timeStamp ?? 0
        self.location = location
    }
}

