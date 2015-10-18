//
//  LocationServiceProtocol.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 18/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

protocol LocationServiceProtocol {
    func getCurrentLocation() throws -> Location
}
