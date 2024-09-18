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
    func add(_ item: ToDoItem) {
        items.append(item)
    }
}
