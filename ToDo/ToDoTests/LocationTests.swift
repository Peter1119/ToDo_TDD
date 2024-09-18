//
//  LocationTests.swift
//  ToDoTests
//
//  Created by 홍석현 on 9/17/24.
//

import XCTest
@testable import ToDo
import CoreLocation

final class LocationTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func test_초기화시_Coordinate값을넣는다() throws {
        let coordinate = Coordinate(latitude: 1, longitude: 2)
        let location = Location(name: "", coordinate: coordinate)
        let resultCoordinate = try XCTUnwrap(location.coordinate)
        
        XCTAssertEqual(resultCoordinate.latitude, 1, accuracy: 0.000_001)
        XCTAssertEqual(resultCoordinate.longitude, 2, accuracy: 0.000_001)
    }
    
    func test_init_setsName() {
        let location = Location(name: "Dummy")
        XCTAssertEqual(location.name, "Dummy")
    }
}
