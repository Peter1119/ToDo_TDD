//
//  ToDoItemStoreTests.swift
//  ToDoTests
//
//  Created by 홍석현 on 9/17/24.
//

import XCTest
@testable import ToDo

final class ToDoItemStoreTests: XCTestCase {
    
    var sut: ToDoItemStore!
    
    override func setUpWithError() throws {
        sut = ToDoItemStore(fileName: "dummy_store")
    }
    
    override func tearDownWithError() throws {
        sut = nil
        let url = FileManager.default.documentsURL(name: "dummy_store")
        try? FileManager.default.removeItem(at: url)
    }
    
    func test_추가하면_publish가바뀌어야한다() throws {
        let toDoItem = ToDoItem(title: "Dummy")
        let receivedItems = try wait(for: sut.itemPublisher) {
            sut.add(toDoItem)
        }
        
        XCTAssertEqual(receivedItems, [toDoItem])
    }
    
    func test_체크_완료된아이템의변경사항을발행해야함() throws {
        let toDoItem = ToDoItem(title: "Dummy")
        sut.add(toDoItem)
        sut.add(ToDoItem(title: "Dummy 2"))
        let receivedItems = try wait(for: sut.itemPublisher) {
            sut.check(toDoItem)
        }
        let doneItems = receivedItems.filter { $0.done }
        XCTAssertEqual(doneItems, [toDoItem])
    }
    
    func test_초기화_이전에저장된할일목록을불러온다() throws {
        var sut1: ToDoItemStore? = ToDoItemStore(fileName: "dummy_store")
        let publisherExpectation = expectation(description: "Wait for publisher in \(#file)")
        let toDoItem = ToDoItem(title: "Dummy Title")
        sut1?.add(toDoItem)
        sut1 = nil
        let sut2 = ToDoItemStore(fileName: "dummy_store")
        var result: [ToDoItem]?
        let token = sut2.itemPublisher.sink { value in
            result = value
            publisherExpectation.fulfill()
        }
        wait(for: [publisherExpectation], timeout: 1)
        token.cancel()
        XCTAssertEqual(result, [toDoItem])
    }
    
    func test_완료표시로체크를하면_해당정보가저장되어업데이트된다() {
        let sut1: ToDoItemStore? = ToDoItemStore(fileName: "dummy_store")
        let publisherExpectation = expectation(description: "Wait for publisher in \(#file)")
        let toDoItem = ToDoItem(title: "Dummy Title")
        sut1?.add(toDoItem)
        sut1?.check(toDoItem)
        sut1 = nil
        let sut2 = ToDoItemStore(fileName: "dummy_store")
        var result: [ToDoItem]?
        let token = sut2.itemPublisher.sink { value in
            result = value
            publisherExpectation.fulfill()
        }
        wait(for: [publisherExpectation], timeout: 1)
        token.cancel()
        XCTAssertEqual(result?.first?.done, true)
    }
}
