//
//  ToDoItemStore.swift
//  ToDo
//
//  Created by 홍석현 on 9/17/24.
//

import Foundation
import Combine

class ToDoItemStore {
    // 실패하지 않는 ToDoItem 배열을 발행하는 CurrentValueSubject 발행자를 생성
    var itemPublisher = CurrentValueSubject<[ToDoItem], Never>([])
    private var items: [ToDoItem] = [] {
        didSet {
            itemPublisher.send(items)
        }
    }
    
    private let fileName: String
    init(fileName: String = "todoitems") {
        self.fileName = fileName
        loadItems()
    }
    
    func add(_ item: ToDoItem) {
        items.append(item)
        saveItems()
    }
    
    func check(_ item: ToDoItem) {
        var mutableItem = item
        mutableItem.done = true
        if let index = items.firstIndex(of: item) {
            items[index] = mutableItem
        }
    }
    
    private func saveItems() {
        if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(fileName) {
            do {
                let data = try JSONEncoder().encode(items)
                try data.write(to: url)
            } catch {
                print("error: \(error)")
            }
        }
    }
    
    // ToDoItemStore.swift
    private func loadItems() {
        if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(fileName) {
            do {
                let data = try Data(contentsOf: url)
                items = try JSONDecoder().decode([ToDoItem].self, from: data)
            } catch {
                print("error: \(error)")
            }
        }
    }
}
