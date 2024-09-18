//
//  ToDoItemStoreTests.swift
//  ToDoTests
//
//  Created by 홍석현 on 9/17/24.
//

import XCTest
@testable import ToDo

final class ToDoItemStoreTests: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}
    
    func test_추가하면_publish가바뀌어야한다() throws {
        let sut = ToDoItemStore()
        let toDoItem = ToDoItem(title: "Dummy")
        let receivedItems = try wait(for: sut.itemPublisher) {
            sut.add(toDoItem)
        }
        
        XCTAssertEqual(receivedItems, [toDoItem])
    }
}
