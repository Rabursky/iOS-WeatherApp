//
//  NetworkingService.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 18/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import SwiftyJSON
import Just



class NetworkingService : ForecastNetworkingProtocol {
    static let sharedService = NetworkingService()
    let appId = "ff287173dfc02d8de3aad212143202e1"
    
    func getForecastJSONWithLocation(location: Location) throws -> JSON {
        let url = "http://api.openweathermap.org/data/2.5/forecast?lat=\(location.lat)&lon=\(location.lon)&units=metric&appid=\(appId)"
        let response = Just.get(url)
        if let error = response.error {
            throw error
        }
        
        if let json = response.json {
            return JSON(json)
        }
        return JSON([])
    }
}
