//
//  WeatherState.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

typealias Temperature = Float

struct WeatherState {
    let date: Date
    let name: String
    let description: String
    let iconName: String
    let current: Temperature
    let min: Temperature
    let max: Temperature
    let pressure: Float
    let humidity: Float
}
