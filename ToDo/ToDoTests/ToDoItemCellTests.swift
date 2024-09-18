//
//  ToDoItemCellTests.swift
//  ToDoTests
//
//  Created by 홍석현 on 9/18/24.
//

import XCTest
@testable import ToDo

final class ToDoItemCellTests: XCTestCase {

    var sut: ToDoItemCell!
    
    override func setUpWithError() throws {
        sut = ToDoItemCell()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_subViews에_titleLabel이있다() {
        XCTAssertTrue(sut.titleLabel.isDescendant(of: sut.contentView))
    }
}
