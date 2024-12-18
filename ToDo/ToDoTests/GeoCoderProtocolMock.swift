//
//  GeoCoderProtocolMock.swift
//  ToDoTests
//
//  Created by 홍석현 on 10/22/24.
//

import Foundation
@testable import ToDo
import CoreLocation

class GeoCoderProtocolMock: GeoCoderProtocol {
    var geocodeAddressString: String?
    var completionHandler: CLGeocodeCompletionHandler?
    
    func geocodeAddressString(
        _ addressString: String,
        completionHandler: @escaping CLGeocodeCompletionHandler
    ) {
        geocodeAddressString = addressString
        self.completionHandler = completionHandler
    }
}
