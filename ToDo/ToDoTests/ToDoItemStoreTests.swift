//
//  ToDoItemStoreTests.swift
//  ToDoTests
//
//  Created by 홍석현 on 9/17/24.
//

import XCTest
@testable import ToDo

final class ToDoItemStoreTests: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}
    
    func test_추가하면_publish가바뀌어야한다() {
        let sut = ToDoItemStore()
        let publisherExpectation = expectation(
            description: "\(#file)에서 퍼블리셔를 기다립니다."
        )
        
        var receivedItems: [ToDoItem] = []
        let token = sut.itemPublisher
            .dropFirst() // 첫 번째 발행된 값을 제외
            .sink { items in
                receivedItems = items
                publisherExpectation.fulfill() // 테스트 러너에게 더 이상 기다릴 필요 없음을 알려줌
            }
        
        let toDoItem = ToDoItem(title: "Dummy")
        sut.add(toDoItem)
        
        wait(for: [publisherExpectation], timeout: 1)
        token.cancel()
        XCTAssertEqual(receivedItems, [toDoItem])
    }
}
