//
//  APIClient.swift
//  ToDo
//
//  Created by 홍석현 on 10/22/24.
//

import Foundation
import CoreLocation

protocol GeoCoderProtocol {
    func geocodeAddressString(
        _ addressString: String,
        completionHandler: @escaping CLGeocodeCompletionHandler
    )
}

extension CLGeocoder: GeoCoderProtocol {}

struct APIClient {
    lazy var geoCoder: GeoCoderProtocol = CLGeocoder()
    
    mutating func coordinate(
        for address: String,
        completion: (Coordinate?) -> Void
    ) {
        geoCoder.geocodeAddressString(address) { placemarks, error in
            
        }
    }
}
