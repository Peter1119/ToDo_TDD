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
    
    override func setUpWithError() throws {
        sut = ToDoItemsListViewController()
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
}
