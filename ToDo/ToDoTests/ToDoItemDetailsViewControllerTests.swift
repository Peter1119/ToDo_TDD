//
//  ToDoItemDetailsViewControllerTests.swift
//  ToDoTests
//
//  Created by 홍석현 on 9/20/24.
//

import XCTest
@testable import ToDo

final class ToDoItemDetailsViewControllerTests: XCTestCase {

    var sut: ToDoItemDetailsViewController!
    
    override func setUpWithError() throws {
        sut = ToDoItemDetailsViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_view에는_타이틀라벨이있다() {
        let subView = sut.titleLabel
        XCTAssertTrue(subView.isDescendant(of: sut.view))
    }
}
