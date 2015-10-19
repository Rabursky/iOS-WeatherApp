//
//  ForecastPresenter.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import Domain

enum ForecastPresenterError : ErrorType {
    case ForcastMissingError
}

class ForecastPresenter : ForecastPresenterProtocol {
    let interactorInvoker: InteractorInvokerProtocol
    let getCurrentLocationInteractor: GetCurrentLocationInteractor
    let getForecastForLocationInteractor: GetForecastForLocationInteractor
    init(interactorInvoker: InteractorInvokerProtocol,
         getCurrentLocationInteractor: GetCurrentLocationInteractor,
         getForecastForLocationInteractor: GetForecastForLocationInteractor) {
        self.interactorInvoker = interactorInvoker
        self.getCurrentLocationInteractor = getCurrentLocationInteractor
        self.getForecastForLocationInteractor = getForecastForLocationInteractor
    }
    
    // MARK: ForecastPresenterProtocol
    
    var forecastView: ForecastViewProtocol? = nil
    func setView(view: ForecastViewProtocol) -> () {
        self.forecastView = view
    }
    
    func updateForecast() -> () {
        self.forecastView?.displayLoading()
        self.interactorInvoker.invoke({ () throws -> () in
            try self.getCurrentLocationInteractor.execute()
            self.getForecastForLocationInteractor.input = self.getCurrentLocationInteractor.output
            try self.getForecastForLocationInteractor.execute()
        }) { [weak self] (error) -> () in
            if let error = error {
                self?.forecastView?.displayError(error)
            } else if let forecast = self?.getForecastForLocationInteractor.output {
                self?.forecastView?.displayForecast(forecast)
            } else {
                self?.forecastView?.displayError(ForecastPresenterError.ForcastMissingError)
            }
        }
    }
}
