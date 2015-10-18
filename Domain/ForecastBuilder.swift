//
//  ForecastBuilder.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import SwiftyJSON

class ForecastBuilder: ModelBuilder<Forecast> {
    let cityBuilder: ModelBuilder<City>
    let weatherStateBuilder: ModelBuilder<WeatherState>
    
    init(cityBuilder: ModelBuilder<City>, weatherStateBuilder: ModelBuilder<WeatherState>) {
        self.cityBuilder = cityBuilder;
        self.weatherStateBuilder = weatherStateBuilder
    }
    
    override func buildInstanceWithJSON(json: JSON) -> Forecast? {
        guard
            let list = json["list"].array,
            let city = self.cityBuilder.buildInstanceWithJSON(json["city"])
        else {
            return nil
        }
        
        var states = [WeatherState]()
        for stateData in list {
            if let state = self.weatherStateBuilder.buildInstanceWithJSON(stateData) {
                states.append(state)
            }
        }
        return Forecast(city: city, states: states)
    }
}
