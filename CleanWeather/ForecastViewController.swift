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
    
    @IBOutlet weak var temperatureLabel: UILabel?
    @IBOutlet weak var cityLabel: UILabel?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    @IBOutlet weak var reloadForecastButton: UIButton?
    

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.presenter.setView(self)
        self.presenter.updateForecast()
    }
    
    @IBAction func reloadForecast() {
        self.presenter.updateForecast()
    }
    
    func updateAsLoading(loading: Bool) {
        if loading {
            cityLabel?.text = "Loading..."
            temperatureLabel?.text = ""
            activityIndicator?.startAnimating()
        }
        activityIndicator?.hidden = !loading
        reloadForecastButton?.hidden = loading
    }
    
    // MARK: ForecastViewProtocol
    
    func displayError(error: ErrorType) {
        updateAsLoading(false)
        cityLabel?.text = "Some error occured!\n\n\(error._domain)"
        temperatureLabel?.text = ""
    }
    
    func displayForecast(forecast: Forecast) {
        updateAsLoading(false)
        cityLabel?.text = forecast.city.name
        if let state: WeatherState = forecast.states.first {
            let temperature = Int(round(state.currentTemperature))
            temperatureLabel?.text = "\(temperature)°"
        } else {
            temperatureLabel?.text = "--"
        }
    }
    
    func displayLoading() {
        updateAsLoading(true)
    }
}
