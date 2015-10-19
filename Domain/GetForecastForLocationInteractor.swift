//
//  GetForecastsForCityInteractor.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

public class GetForecastForLocationInteractor : InteractorProtocol {
    public var input: Location?
    public var output: Forecast?
    
    let networkingService: ForecastNetworkingProtocol
    let builder: ModelBuilder<Forecast>
    init(networkingService: ForecastNetworkingProtocol, builder: ModelBuilder<Forecast>) {
        self.networkingService = networkingService
        self.builder = builder
    }
    
    public func execute() throws -> () {
        if let location = input {
            let json = try networkingService.getForecastJSONWithLocation(location)
            output =  builder.buildInstanceWithJSON(json)
        } else {
            throw InteractorError.InputDataMissing
        }
    }
}
