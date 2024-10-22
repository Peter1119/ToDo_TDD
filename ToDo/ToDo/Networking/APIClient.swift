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

// APIClient.swift
protocol APIClientProtocol {
    func coordinate(
      for: String,
      completion: @escaping (Coordinate?) -> Void
    )
}

class APIClient {
    lazy var geoCoder: GeoCoderProtocol = CLGeocoder()
    
    func coordinate(
        for address: String,
        completion: @escaping (Coordinate?) -> Void
    ) {
        geoCoder.geocodeAddressString(address) { placemarks, error in
            guard let clCoordinate = placemarks?.first?.location?.coordinate else {
                completion(nil)
                return
            }
            
            let coordinate = Coordinate(latitude: clCoordinate.latitude, longitude: clCoordinate.longitude)
            completion(coordinate)
        }
    }
}
