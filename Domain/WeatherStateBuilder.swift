//
//  WeatherStateBuilder.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import SwiftyJSON

class WeatherStateBuilder: ModelBuilder<WeatherState> {
    override func buildInstanceWithJSON(json: JSON) -> WeatherState? {
        guard
            let dateString = json["dt_txt"].string,
            let temp = json["main"]["temp"].float,
            let min = json["main"]["temp_min"].float,
            let max = json["main"]["temp_max"].float,
            let pressure = json["main"]["pressure"].float,
            let humidity = json["main"]["humidity"].float,
            let weather = json["weather"].array,
                let firstWeather = weather.first,
                    let name = firstWeather["main"].string,
                    let description = firstWeather["description"].string,
                    let icon = firstWeather["icon"].string
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
