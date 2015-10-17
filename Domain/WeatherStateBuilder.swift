//
//  WeatherStateBuilder.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import Foundation

class WeatherStateBuilder: ModelBuilder<WeatherState> {
    override func buildInstanceWithDictionary(dictionary: [String : Any]) -> WeatherState? {
        guard
            let dateString = dictionary["dt_txt"],
            let main = dictionary["main"] as? [String:Double],
                let temp = main["temp"],
                let min = main["temp_min"],
                let max = main["temp_max"],
                let pressure = main["pressure"],
                let humidity = main["humidity"],
            let weather = dictionary["weather"] as! [[String:NSObject]]?,
                let firstWeather = weather.first,
                    let name = firstWeather["main"],
                    let description = firstWeather["description"],
                    let icon = firstWeather["icon"]
        else {
            return nil
        }
        
        let desiredDate: Date = Date(timeIntervalSince1970: 0)
        return WeatherState(
            date: desiredDate,
            name: String(name),
            description: String(description),
            iconName: String(icon),
            currentTemperature: Float(temp),
            minTemperature: Float(min),
            maxTemperature: Float(max),
            pressure: Float(pressure),
            humidity: Float(humidity)
        )
    }
}
