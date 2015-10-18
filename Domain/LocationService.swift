//
//  LocationService.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 18/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import CoreLocation
import SwiftyDispatch

public enum LocationError : ErrorType {
    case AccessDenied
    case CouldNotDetermine
}

class LocationService : NSObject, CLLocationManagerDelegate, LocationServiceProtocol {
    static let sharedService = LocationService()
    
    private let locationManager = CLLocationManager()
    private let authorizationSemaphore = Semaphore(0)
    private let locationDeterminedSemaphore = Semaphore(0)
    private var currentLocation: Location?
    
    func getCurrentLocation() throws -> Location {
        locationManager.delegate = self
        checkIfAuthorizationStatusDetermined()
        try checkIfAuthorizatonStatusIsNotDenied()
        return try determineLocation()
    }
    
    private func checkIfAuthorizationStatusDetermined() {
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.NotDetermined {
            Queue.main().async({ [weak self] in
                self?.locationManager.requestWhenInUseAuthorization()
                })
            authorizationSemaphore.wait()
        }
    }
    
    private func checkIfAuthorizatonStatusIsNotDenied() throws {
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.Denied {
            throw LocationError.AccessDenied
        }
    }
    
    private func determineLocation() throws -> Location {
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.startUpdatingLocation()
        locationDeterminedSemaphore.wait()
        
        if let location = currentLocation {
            return location
        } else {
            throw LocationError.CouldNotDetermine
        }
    }
    
    // MARK: LocationManager Delegate
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        authorizationSemaphore.signal()
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            currentLocation = Location(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
            manager.stopUpdatingLocation()
            locationDeterminedSemaphore.signal()
        }
    }
}
