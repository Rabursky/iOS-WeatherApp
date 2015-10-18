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
    
    func getForecastJSONWithLocation(location: Location) throws -> JSON {
        let url = "http://api.openweathermap.org/data/2.5/forecast?lat=39.88&lon=-83.45&units=metric&appid=ff287173dfc02d8de3aad212143202e1"
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
