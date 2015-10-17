//
//  CityModel.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

struct City {
    let id: String
    let location: Location
    let name: String?
}

extension City: Equatable {}
func ==(lhs: City, rhs: City) -> Bool {
    return lhs.id == rhs.id && lhs.location == rhs.location && lhs.name == rhs.name
}
