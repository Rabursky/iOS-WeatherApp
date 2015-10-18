//
//  CityMapperTestCase.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import XCTest
import SwiftyJSON

class CityBuilderTestCase: XCTestCase {
    var builder: ModelBuilder<City>!
    var correctJSON: JSON!

    override func setUp() {
        super.setUp()
        self.correctJSON = JSON(["id":321321, "coord":["lat":1.12, "lon":3.321], "name":"City"])
        self.builder = CityBuilder()
    }

    func testReturnsNilIfRequiredKeysMissing() {
        XCTAssertNil(self.builder.buildInstanceWithJSON(JSON(["name":"SuperCity", "id":"123"])))
        XCTAssertNil(self.builder.buildInstanceWithJSON(JSON(["coord":"123"])))
    }
    
    func testReturnsInstanceWhenRequiredKeysAvailable() {
        XCTAssertNotNil(self.builder.buildInstanceWithJSON(correctJSON))
    }
    
    func testMappsKeysCorrectly() {
        let desiredCity = City(id: "321321", location: Location(lat:1.12, lon:3.321), name:"City")
        let city = self.builder.buildInstanceWithJSON(correctJSON)
        if let builtCity = city {
            XCTAssertEqual(builtCity, desiredCity)
        } else {
            XCTFail()
        }
    }

}
