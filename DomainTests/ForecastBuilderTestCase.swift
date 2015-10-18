//
//  ForecastBuilderTestCase.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import XCTest
import SwiftyJSON

class CityBuilderMock: ModelBuilder<City> {
    let city: City
    init(city: City) {
        self.city = city
    }
    override func buildInstanceWithJSON(json: JSON) -> City? {
        return city
    }
}

class WeatherStateBuilderMock: ModelBuilder<WeatherState> {
    let state: WeatherState
    init(state: WeatherState) {
        self.state = state
    }
    override func buildInstanceWithJSON(json: JSON) -> WeatherState? {
        return state
    }
}

class ForecastBuilderTestCase: XCTestCase {
    var builder: ModelBuilder<Forecast>!
    var mockCity: City!
    var mockState: WeatherState!
    let correctJSON = JSON([
        "city": [
            "City": "data",
            "coord": [
                "lon": -83.44825,
                "lat": 39.886452
            ],
        ],
        "cod": "200",
        "message": 0.0121,
        "cnt": 40,
        "list": [
            [
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
            ]
        ]
    ])
    
    override func setUp() {
        super.setUp()
        mockCity = City(id: "id", location: Location(lat: 1, lon: 1), name:"CityName")
        let cityBuilder = CityBuilderMock(city: mockCity)
        
        let desiredDate: Date = Date(timeIntervalSince1970: 0)
        mockState = WeatherState(
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
        let stateBuilder = WeatherStateBuilderMock(state: mockState)
        
        self.builder = ForecastBuilder(cityBuilder: cityBuilder, weatherStateBuilder: stateBuilder)
    }
    
    func testReturnsNilIfRequiredKeysMissing() {
        XCTAssertNil(self.builder.buildInstanceWithJSON(JSON(["coord":"123"])))
    }
    
    func testReturnsInstanceWhenRequiredKeysAvailable() {
        XCTAssertNotNil(self.builder.buildInstanceWithJSON(correctJSON))
    }
    
    func testMappsKeysCorrectly() {
        let desiredForecast = Forecast(city: mockCity, states: [mockState])
        let forecast = self.builder.buildInstanceWithJSON(correctJSON)
        if let builtForecast = forecast {
            XCTAssertEqual(builtForecast, desiredForecast)
        } else {
            XCTFail()
        }
    }

}
