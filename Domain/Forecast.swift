//
//  ForecastModel.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

class Forecast {
    let city: City
    let states: [WeatherState]
    init(city: City, states: [WeatherState]) {
        self.city = city
        self.states = states
    }
}

extension Forecast : Equatable {}
func ==(lhs: Forecast, rhs: Forecast) -> Bool {
    return
        lhs.city == rhs.city &&
        lhs.states == rhs.states
}