//
//  InteractorsFactory.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 18/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

public class InteractorFactory {
    public class func getForecastForLocationInteractor() -> GetForecastForLocationInteractor {
        let builder = ForecastBuilder(cityBuilder: CityBuilder(), weatherStateBuilder: WeatherStateBuilder())
        return GetForecastForLocationInteractor(networkingService: NetworkingService.sharedService, builder: builder)
    }
    public class func getCurrentLocationInteractor() -> GetCurrentLocationInteractor {
        return GetCurrentLocationInteractor(locationService: LocationService.sharedService)
    }
}