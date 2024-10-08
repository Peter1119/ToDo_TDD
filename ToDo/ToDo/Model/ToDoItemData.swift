//
//  ToDoItemData.swift
//  ToDo
//
//  Created by 홍석현 on 9/26/24.
//

import Foundation

class ToDoItemData: ObservableObject {
    @Published var title = ""
    @Published var date = Date()
}
