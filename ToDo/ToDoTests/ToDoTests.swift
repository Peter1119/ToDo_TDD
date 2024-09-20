//
//  ToDoTests.swift
//  ToDoTests
//
//  Created by 홍석현 on 9/12/24.
//

import XCTest
@testable import ToDo

class ToDoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_init_takesDescription() {
        let item = ToDoItem(title: "Dummy", description: "Dummy Description")
        XCTAssertEqual(item.description, "Dummy Description")
    }
    
    func test_init_시간스탬프가주어지면_시간스탬프가설정된다() {
        let timeStamp  = 1_600_000_000.0
        let item = ToDoItem(title: "Dummy", description: nil, timeStamp: timeStamp)
        XCTAssertEqual(item.timeStamp!, timeStamp, accuracy: 0.000_001)
    }
    
    func test_init_위치속성추가() {
        let location = Location(name: "Home")
        _ = ToDoItem(title: "Dummy", location: location)
    }
    
    func test_location이주어지면_location이설정됨() {
        let location = Location(name: "Home")
        let item = ToDoItem(title: "Dummy", location: location)
        XCTAssertEqual(item.location?.name, location.name)
    }
}
