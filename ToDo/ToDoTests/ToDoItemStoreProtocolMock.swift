//
//  ToDoItemStoreProtocolMock.swift
//  ToDoTests
//
//  Created by 홍석현 on 9/18/24.
//

import Foundation
import Combine
@testable import ToDo

class ToDoItemStoreProtocolMock: ToDoItemStoreProtocol {
    var itemPublisher = CurrentValueSubject<[ToDoItem], Never>([])
    var checkLastCallArgument: ToDoItem?
    
    func check(_ item: ToDoItem) {
        checkLastCallArgument = item
    }
}
