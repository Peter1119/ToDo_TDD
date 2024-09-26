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
        sut = ToDoItemInputView(toDoItemData: todoItemData)
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
}
