//
//  GetCurrentLocationInteractor.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 18/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

public class GetCurrentLocationInteractor : InteractorProtocol {
    public var output: Location?
    
    let locationService: LocationServiceProtocol
    init(locationService: LocationServiceProtocol) {
        self.locationService = locationService
    }
    
    public func execute() throws {
        output = try locationService.getCurrentLocation()
    }
}
