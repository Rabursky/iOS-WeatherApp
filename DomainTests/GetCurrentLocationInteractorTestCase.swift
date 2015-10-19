//
//  GetCurrentLocationInteractorTestCase.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 19/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import XCTest

class LocationServiceMock: LocationServiceProtocol {
    var location: Location!
    var throwsError: Bool = false
    func getCurrentLocation() throws -> Location {
        if throwsError {
            throw TestError.Error
        }
        return location
    }
}

class GetCurrentLocationInteractorTestCase: DomainTests {
    var interactor: GetCurrentLocationInteractor!
    var locationService: LocationServiceMock!
    
    override func setUp() {
        super.setUp()
        locationService = LocationServiceMock()
        interactor = GetCurrentLocationInteractor(locationService: locationService)
    }

    func testThrowsErrorWhenLocationServiceThrows() {
        locationService.throwsError = true
        AssertInteractorThrowsOnExecute(interactor)
    }

    func testReturnsLocationReturnedByTheService() {
        let location = Location(lat: 1, lon: 1)
        locationService.location = location
        try! interactor.execute()
        XCTAssertEqual(interactor.output, location)
    }
}
