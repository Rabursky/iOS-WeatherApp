//
//  CityMapper.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

class CityBuilder: ModelBuilder<City> {
    override func buildInstanceWithDictionary(dictionary: [String : Any]) -> City? {
        guard
            let id = dictionary["id"],
            let coord = dictionary["coord"] as! [String:Double]?,
            let lat = coord["lat"],
            let lon = coord["lon"] else {
            return nil
        }
        
        let location = Location(lat: lat, lon: lon)
        let name = dictionary["name"] as! String?
        return City(id: String(id), location: location, name: name)
    }
}