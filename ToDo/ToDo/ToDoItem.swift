//
//  ToDoItem.swift
//  ToDo
//
//  Created by 홍석현 on 9/12/24.
//


import Foundation

struct ToDoItem {
    let title: String
    let description: String?
    let timeStamp: Double
    let location: Location?
    
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

