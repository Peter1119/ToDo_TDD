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
    
    func test_체크_완료된아이템의변경사항을발행해야함() throws {
        let sut = ToDoItemStore()
        let toDoItem = ToDoItem(title: "Dummy")
        sut.add(toDoItem)
        sut.add(ToDoItem(title: "Dummy 2"))
        let receivedItems = try wait(for: sut.itemPublisher) {
            sut.check(toDoItem)
        }
        let doneItems = receivedItems.filter { $0.done }
        XCTAssertEqual(doneItems, [toDoItem])
    }
}
