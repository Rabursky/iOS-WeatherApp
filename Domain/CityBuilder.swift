//
//  CityMapper.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import SwiftyJSON

class CityBuilder: ModelBuilder<City> {
    override func buildInstanceWithJSON(json: JSON) -> City? {
        guard
            let id = json["id"].int,
            let lat = json["coord"]["lat"].double,
            let lon = json["coord"]["lon"].double else {
            return nil
        }
        
        let location = Location(lat: lat, lon: lon)
        let name = json["name"].string
        return City(id: String(id), location: location, name: name)
    }
}