//
//  WeatherStateBuilderTestCase.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import XCTest
import SwiftyJSON

class WeatherStateBuilderTestCase: XCTestCase {
    var builder: ModelBuilder<WeatherState>!
    let correctJSON = JSON([
        "dt": 1445104800,
        "main":[
            "temp": 9.74,
            "temp_min": 9.74,
            "temp_max": 10.54,
            "pressure": 1005.69,
            "sea_level": 1040.66,
            "grnd_level": 1005.69,
            "humidity": 47,
            "temp_kf": -0.8
        ],
        "weather": [
            [
                "id": 321,
                "main": "Clouds",
                "description": "few clouds",
                "icon": "02d"
            ]
        ],
        "clouds": [
            "all": 12
        ],
        "wind": [
            "speed": 4.04,
            "deg": 317.504
        ],
        "sys": [
            "pod": "d"
        ],
        "dt_txt": "2015-10-17 18:00:00"
    ])
    
    override func setUp() {
        super.setUp()
        self.builder = WeatherStateBuilder()
    }
    
    func testReturnsNilIfRequiredKeysMissing() {
        XCTAssertNil(self.builder.buildInstanceWithJSON(JSON(["coord":"123"])))
    }
    
    func testReturnsInstanceWhenRequiredKeysAvailable() {
        XCTAssertNotNil(self.builder.buildInstanceWithJSON(correctJSON))
    }
    
    func testMappsKeysCorrectly() {
        // TODO: fix later
        let desiredDate: Date = Date(timeIntervalSince1970: 0)
        let desiredWeatherState = WeatherState(
            date: desiredDate,
            name: "Clouds",
            description: "few clouds",
            iconName: "02d",
            currentTemperature: 9.74,
            minTemperature: 9.74,
            maxTemperature: 10.54,
            pressure: 1005.69,
            humidity: 47
        )
        
        let state = self.builder.buildInstanceWithJSON(correctJSON)
        if let builtState = state {
            XCTAssertEqual(builtState, desiredWeatherState)
        } else {
            XCTFail()
        }
    }

}
