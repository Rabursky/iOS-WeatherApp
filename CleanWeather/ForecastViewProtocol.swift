//
//  ForecastViewProtocol.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import Domain

public protocol ForecastViewProtocol {
    func displayError(error: ErrorType)
    func displayForecast(forecast: Forecast)
    func displayLoading()
}
