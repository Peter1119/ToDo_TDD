//
//  Location.swift
//  ToDo
//
//  Created by 홍석현 on 9/12/24.
//

import Foundation

struct Location: Equatable, Codable {
    
    let name: String
    let coordinate: Coordinate?
    
    init(
        name: String,
        coordinate: Coordinate? = nil
    ) {
        self.name = name
        self.coordinate = coordinate
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        if lhs.name != rhs.name {
            return false
        }
        
        if lhs.coordinate == nil, rhs.coordinate != nil {
            return false
        }
        
        if lhs.coordinate != nil, rhs.coordinate == nil {
            return false
        }
        
        if let lhsCoordinate = lhs.coordinate, let rhsCoordinate = rhs.coordinate {
            if abs(lhsCoordinate.longitude - rhsCoordinate.longitude) > 0.000_0001 {
                return false
            }
            
            if abs(lhsCoordinate.latitude - rhsCoordinate.latitude) > 0.000_0001 {
                return false
            }
        }
        
        return false
    }
}
