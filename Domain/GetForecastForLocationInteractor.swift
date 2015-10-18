//
//  GetForecastsForCityInteractor.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

public class GetForecastForLocationInteractor {
    public var location: Location? = nil
    init() {
        
    }
    public func execute() throws -> Forecast {
        let json = try NetworkingService.sharedService.getForecastJSONWithLocation(Location(lat: 1, lon: 1))
        let builder = ForecastBuilder(cityBuilder: CityBuilder(), weatherStateBuilder: WeatherStateBuilder())
        return builder.buildInstanceWithJSON(json)!
    }
}
