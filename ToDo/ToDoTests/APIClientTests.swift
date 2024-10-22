//
//  APIClientTests.swift
//  ToDoTests
//
//  Created by 홍석현 on 10/22/24.
//

import XCTest
@testable import ToDo
import Intents
import Contacts

final class APIClientTests: XCTestCase {
    var sut: APIClient!

    override func setUpWithError() throws {
        sut = APIClient()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_coordinate_fetchesCoordinate() {
        let geoCoderMock = GeoCoderProtocolMock()
        sut.geoCoder = geoCoderMock
        let location = CLLocation(latitude: 1, longitude: 2)
        let placemark = CLPlacemark(location: location, name: nil, postalAddress: nil)
        var result: Coordinate?
        
        sut.coordinate(for: "") { coordinate in
            result = coordinate
        }
        
        geoCoderMock.completionHandler?([placemark], nil)
        XCTAssertEqual(result?.latitude, location.coordinate.latitude)
        XCTAssertEqual(result?.longitude, location.coordinate.longitude)
    }
    
    func test_coordinate_GeoCoder가Address가있으면같아야한다() {
        let geoCoderMock = GeoCoderProtocolMock()
        sut.geoCoder = geoCoderMock
        let expectedAddress = "dummy_address"
        sut.coordinate(for: expectedAddress, completion: { _ in })
        XCTAssertEqual(geoCoderMock.geocodeAddressString, expectedAddress)
    }
}
