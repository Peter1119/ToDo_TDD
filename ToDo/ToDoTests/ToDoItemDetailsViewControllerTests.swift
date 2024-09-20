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
    
    func test_ToDoItems을설정하면_titleLabel이업데이트되어야한다() {
        let title = "dummy Title"
        let toDoItem = ToDoItem(title: title)
        sut.toDoItem = toDoItem
        XCTAssertEqual(sut.titleLabel.text, title)
    }
    
    func test_ToDoItem을설정하면_dateLabel이_업데이트되어야한다() {
        let date = Date()
        let toDoItem = ToDoItem(title: "dummy title", timeStamp: date.timeIntervalSince1970)
        sut.toDoItem = toDoItem

        XCTAssertEqual(sut.dateLabel.text, sut.dateFormatter.string(from: date))
    }

    func test_ToDoItem을설정하면_descriptionLabel이_업데이트되어야한다() {
        let description = "dummy description"
        let toDoItem = ToDoItem(title: "dummy title", description: description)
        sut.toDoItem = toDoItem

        XCTAssertEqual(sut.descriptionLabel.text, description)
    }

    func test_ToDoItem을설정하면_locationLabel이_업데이트되어야한다() {
        let location = "dummy location"
        let toDoItem = ToDoItem(title: "dummy title", location: Location(name: location))
        sut.toDoItem = toDoItem

        XCTAssertEqual(sut.locationLabel.text, location)
    }
}
