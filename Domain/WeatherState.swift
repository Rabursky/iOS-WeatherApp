//
//  WeatherState.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

public typealias Temperature = Float

public struct WeatherState {
    let date: Date
    public let name: String
    public let description: String
    public let iconName: String
    public let currentTemperature: Temperature
    public let minTemperature: Temperature
    public let maxTemperature: Temperature
    public let pressure: Float
    public let humidity: Float
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

