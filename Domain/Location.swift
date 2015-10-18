//
//  Location.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

public struct Location {
    let lat: Double
    let lon: Double
}

extension Location: Equatable {}
public func ==(lhs: Location, rhs: Location) -> Bool {
    return lhs.lat == rhs.lat && lhs.lon == rhs.lon
}
