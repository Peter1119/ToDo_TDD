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
    
    func test_numberOfRows_두개의아이템을넣으면_두개를리턴한다() {
        toDoItemStoreMock.itemPublisher.send([
            ToDoItem(title: "dummy 1"),
            ToDoItem(title: "dummy 2")
        ])
        let result = sut.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(result, 2)
    }
    
    func test_cellForRowAt_cell이Title이나와야한다() throws {
        let titleUnderTest = "dummy 1"
        toDoItemStoreMock.itemPublisher.send([
            ToDoItem(title: titleUnderTest)
        ])
        
        let tableView = sut.tableView
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = try XCTUnwrap(
            tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath) as? ToDoItemCell
        )
        XCTAssertEqual(cell.titleLabel.text, titleUnderTest)
    }
    
    func test_cellForRowAt_cell이Title2가나와야한다() throws {
        let titleUnderTest = "dummy 2"
        toDoItemStoreMock.itemPublisher.send([
            ToDoItem(title: "dummy 1"),
            ToDoItem(title: titleUnderTest)
        ])
        
        let tableView = sut.tableView
        let indexPath = IndexPath(row: 1, section: 0)
        let cell = try XCTUnwrap(
            tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath) as? ToDoItemCell
        )
        XCTAssertEqual(cell.titleLabel.text, titleUnderTest)
    }
    
    func test_cellForRowAt_cell에Date가표시되어야한다() throws {
        let date = Date()
        toDoItemStoreMock.itemPublisher.send([
            ToDoItem(title: "dummy 1", timeStamp: date.timeIntervalSince1970)
        ])
        
        let tableView = sut.tableView
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = try XCTUnwrap(
            tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath) as? ToDoItemCell
        )
        XCTAssertEqual(cell.dateLabel.text, sut.dateFormatter.string(from: date))
    }
    
    func test_numberOfSections_두개의섹션을리턴한다() {
        var doneItem = ToDoItem(title: "dummy 2")
        doneItem.done = true
        toDoItemStoreMock.itemPublisher.send([
            ToDoItem(title: "dummy 1"),
            doneItem
        ])
        let result = sut.tableView.numberOfSections
        XCTAssertEqual(result, 2)
    }
    
    func test_셀이선택이되면_델리게이트가호출된다() throws {
        let delegateMock = ToDoItemsListViewControllerProtocolMock()
        sut.delegate = delegateMock
        let toDoItem = ToDoItem(title: "dummy 1")
        toDoItemStoreMock.itemPublisher.send([toDoItem])
        let tableView = sut.tableView
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.delegate?.tableView?(tableView, didSelectRowAt: indexPath)
        
        XCTAssertEqual(delegateMock.selectToDoItemReceivedArguments?.item, toDoItem)
    }
}
