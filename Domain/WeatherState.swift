//
//  WeatherState.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

typealias Temperature = Float

public struct WeatherState {
    let date: Date
    let name: String
    let description: String
    let iconName: String
    let currentTemperature: Temperature
    let minTemperature: Temperature
    let maxTemperature: Temperature
    let pressure: Float
    let humidity: Float
}

extension WeatherState: Equatable {}
public func ==(lhs: WeatherState, rhs: WeatherState) -> Bool {
    return
        lhs.date.isEqualToDate(rhs.date) &&
        lhs.name == rhs.name &&
        lhs.description == rhs.description &&
        lhs.iconName == rhs.iconName &&
        lhs.currentTemperature == rhs.currentTemperature &&
        lhs.minTemperature == rhs.minTemperature &&
        lhs.maxTemperature == rhs.maxTemperature &&
        lhs.pressure == rhs.pressure &&
        lhs.humidity == rhs.humidity
}

