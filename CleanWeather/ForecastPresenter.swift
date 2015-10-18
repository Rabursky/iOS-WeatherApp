//
//  ForecastPresenter.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import Domain

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
        loadLocation()
    }
    
    // MARK: Private
    
    func loadLocation() {
        self.interactorInvoker.invoke(self.getCurrentLocationInteractor) { [weak self] (error) -> () in
            if let error = error {
                self?.forecastView?.displayError(error)
            } else {
                self?.loadForecast()
            }
        }
    }
    
    func loadForecast() {
        self.getForecastForLocationInteractor.input = self.getCurrentLocationInteractor.output
        self.interactorInvoker.invoke(self.getForecastForLocationInteractor) { [weak self] (error) -> () in
            if let error = error {
                self?.forecastView?.displayError(error)
            } else {
                self?.didLoadForecast()
            }
        }
    }
    
    func didLoadForecast() {
        print(self.getForecastForLocationInteractor.output?.city.name)
    }
}
