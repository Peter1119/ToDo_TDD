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
    
    func test_view에는_타이틀라벨이_있다() {
        let subView = sut.titleLabel
        XCTAssertTrue(subView.isDescendant(of: sut.view))
    }

    func test_view에는_데이트라벨이_있다() {
        let subView = sut.dateLabel
        XCTAssertTrue(subView.isDescendant(of: sut.view))
    }

    func test_view에는_로케이션라벨이_있다() {
        let subView = sut.locationLabel
        XCTAssertTrue(subView.isDescendant(of: sut.view))
    }

    func test_view에는_디스크립션라벨이_있다() {
        let subView = sut.descriptionLabel
        XCTAssertTrue(subView.isDescendant(of: sut.view))
    }

    func test_view에는_맵뷰가_있다() {
        let subView = sut.mapView
        XCTAssertTrue(subView.isDescendant(of: sut.view))
    }
    
    func test_view에는_doneButton이_있다() {
        let subView = sut.doneButton
        XCTAssertTrue(subView.isDescendant(of: sut.view))
    }
}
