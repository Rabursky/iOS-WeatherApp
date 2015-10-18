//
//  InteractorsFactory.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 18/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

public class InteractorFactory {
    public class func getForecastForLocationInteractor() -> GetForecastForLocationInteractor {
        return GetForecastForLocationInteractor()
    }
    public class func getCurrentLocationInteractor() -> GetCurrentLocationInteractor {
        return GetCurrentLocationInteractor()
    }
}