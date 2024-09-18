//
//  ToDoItemsListViewControllerTests.swift
//  ToDoTests
//
//  Created by 홍석현 on 9/18/24.
//

import XCTest
@testable import ToDo

final class ToDoItemsListViewControllerTests: XCTestCase {
    var sut: ToDoItemsListViewController!
    var toDoItemStoreMock: ToDoItemStoreProtocolMock!
    
    override func setUpWithError() throws {
        sut = ToDoItemsListViewController()
        toDoItemStoreMock = ToDoItemStoreProtocolMock()
        sut.toDoItemStore = toDoItemStoreMock
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_shouldBeSetup() {
        XCTAssertNotNil(sut)
    }
    
    func test_tableView를가지고있다() {
        XCTAssertTrue(sut.tableView.isDescendant(of: sut.view))
    }
    
    func test_numberOfRows_하나의아이템을넣으면_한개를리턴한다() {
        toDoItemStoreMock.itemPublisher.send([ToDoItem(title: "dummy 1")])
        let result = sut.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(result, 1)
    }
}
