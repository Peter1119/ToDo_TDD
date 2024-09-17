//
//  Location.swift
//  ToDo
//
//  Created by 홍석현 on 9/12/24.
//

import Foundation
import CoreLocation

struct Location {
    let name: String
    let coordinate: CLLocationCoordinate2D?
    
    init(
        name: String,
        coordinate: CLLocationCoordinate2D? = nil
    ) {
        self.name = name
        self.coordinate = coordinate
    }
}
