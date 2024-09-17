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
    }
}
