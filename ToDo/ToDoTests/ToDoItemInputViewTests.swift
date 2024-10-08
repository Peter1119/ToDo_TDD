//
//  ToDoItemInputViewTests.swift
//  ToDoTests
//
//  Created by 홍석현 on 9/26/24.
//

import XCTest
@testable import ToDo
import ViewInspector

final class ToDoItemInputViewTests: XCTestCase {

    var sut: ToDoItemInputView!
    var todoItemData: ToDoItemData!
    
    override func setUpWithError() throws {
        todoItemData = ToDoItemData()
        sut = ToDoItemInputView(data: todoItemData)
    }

    override func tearDownWithError() throws {
        todoItemData = nil
        sut = nil
    }
    
    func test_titleInput_Data에값이Set된다() throws {
        let expected = "dummy title"
        try sut
            .inspect()
            .find(ViewType.TextField.self)
            .setInput(expected)
        
        let input = todoItemData.title
        XCTAssertEqual(input, expected)
    }
    
    func test_날짜가없으면_DateInput은보여주지않는다() {
        XCTAssertThrowsError(try sut.inspect().find(ViewType.DatePicker.self)) 
    }
    
    func test_Date가있으면_DateInput은보여준다() {
        let exp = sut.on(\.didAppear) { view in
            try view.find(ViewType.Toggle.self).tap()
            let expected = Date(timeIntervalSinceNow: 1_000_000)
            try view.find(ViewType.DatePicker.self).select(date: expected)
            let input = self.todoItemData.date
            XCTAssertEqual(input, expected)
        }
        
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 0.1)
    }
}
