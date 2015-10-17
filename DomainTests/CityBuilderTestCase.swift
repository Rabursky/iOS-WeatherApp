//
//  CityMapperTestCase.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import XCTest

class CityBuilderTestCase: XCTestCase {
    var builder: ModelBuilder<City>!
    let correctDictionary: [String:Any] = ["id":321321, "coord":["lat":1.12, "lon":3.321], "name":"City"]

    override func setUp() {
        super.setUp()
        self.builder = CityBuilder()
    }

    func testReturnsNilIfRequiredKeysMissing() {
        XCTAssertNil(self.builder.buildInstanceWithDictionary(["name":"SuperCity", "id":"123"]))
        XCTAssertNil(self.builder.buildInstanceWithDictionary(["coord":"123"]))
    }
    
    func testReturnsInstanceWhenRequiredKeysAvailable() {
        XCTAssertNotNil(self.builder.buildInstanceWithDictionary(correctDictionary))
    }
    
    func testMappsKeysCorrectly() {
        let desiredCity = City(id: "321321", location: Location(lat:1.12, lon:3.321), name:"City")
        let city = self.builder.buildInstanceWithDictionary(correctDictionary)
        if let builtCity = city {
            XCTAssertEqual(builtCity, desiredCity)
        } else {
            XCTFail()
        }
    }

}
