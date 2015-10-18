//
//  LocationServiceProtocol.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 18/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

public enum LocationError : ErrorType {
    case AccessDenied
    case CouldNotDetermine
}

protocol LocationServiceProtocol {
    func getCurrentLocation() throws -> Location
}
