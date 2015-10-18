//
//  CityModel.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

public struct City {
    public let id: String
    public let location: Location
    public let name: String?
}

extension City: Equatable {}
public func ==(lhs: City, rhs: City) -> Bool {
    return lhs.id == rhs.id && lhs.location == rhs.location && lhs.name == rhs.name
}
