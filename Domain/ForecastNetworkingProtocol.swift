//
//  ForecastNetworkingProtocol.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 18/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import SwiftyJSON

protocol ForecastNetworkingProtocol {
    func getForecastJSONWithLocation(location: Location) throws -> JSON
}
