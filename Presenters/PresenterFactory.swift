//
//  PresenterFactory.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 18/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import Domain

public class PresenterFactory {
    static let invoker = InteractorInvoker()
    
    public class func forecastPresenter() -> ForecastPresenterProtocol {
        let locationInteractor = InteractorFactory.getCurrentLocationInteractor()
        let forecastInteractor = InteractorFactory.getForecastForLocationInteractor()
        return ForecastPresenter(interactorInvoker: invoker,
            getCurrentLocationInteractor: locationInteractor, getForecastForLocationInteractor: forecastInteractor)
    }
}
