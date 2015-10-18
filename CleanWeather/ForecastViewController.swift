//
//  ForecastViewController.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import UIKit
import Presenters
import Domain

class ForecastViewController: UIViewController, ForecastViewProtocol {
    let presenter: ForecastPresenterProtocol = PresenterFactory.forecastPresenter()

    override func viewDidAppear(animated: Bool) {
        self.presenter.setView(self)
        self.presenter.updateForecast()
    }
    
    // MARK: ForecastViewProtocol
    
    func displayError(error: ErrorType) {
        print(error)
    }
    
    func displayForecast(forecast: Forecast) {
        
    }
    
    func displayLoading() {
        
    }
}
