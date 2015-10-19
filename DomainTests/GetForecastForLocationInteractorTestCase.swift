//
//  GetForecastForLocationInteractorTestCase.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 19/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import XCTest
import SwiftyJSON

class NetworkingServiceMock: ForecastNetworkingProtocol {
    var throwsError: Bool = false
    var json: JSON = JSON([])
    func getForecastJSONWithLocation(location: Location) throws -> JSON {
        if throwsError {
            throw TestError.Error
        }
        return json
    }
}

class ForecastBuilderMock: ModelBuilder<Forecast> {
    var forecast: Forecast?
    override func buildInstanceWithJSON(json: JSON) -> Forecast? {
        return forecast
    }
}

class GetForecastForLocationInteractorTestCase: DomainTests {
    var interactor: GetForecastForLocationInteractor!
    var networkingService: NetworkingServiceMock!
    var builder: ForecastBuilderMock!

    override func setUp() {
        super.setUp()
        builder = ForecastBuilderMock()
        networkingService = NetworkingServiceMock()
        interactor = GetForecastForLocationInteractor(networkingService: networkingService, builder: builder)
        interactor.input = Location(lat: 1, lon: 1)
    }

    func testThrowsIfInputLocationIsMissing() {
        interactor.input = nil
        AssertInteractorThrowsOnExecute(interactor)
    }

    func testThrowsIfNetworkingServiceThrows() {
        networkingService.throwsError = true
        AssertInteractorThrowsOnExecute(interactor)
    }
    
    func testOutputIsNilWhenBuilderReturnsNil() {
        builder.forecast = nil
        try! interactor.execute()
        XCTAssertNil(interactor.output)
    }
    
    func testOutputIsForecastReturnedByTheBuilder() {
        let desiredForecast = Forecast(city: City(id: "t", location: interactor.input!, name: "TEST"), states: Array<WeatherState>())
        builder.forecast = desiredForecast
        try! interactor.execute()
        XCTAssertNotNil(interactor.output)
        XCTAssertEqual(interactor.output!, desiredForecast)
    }
}
