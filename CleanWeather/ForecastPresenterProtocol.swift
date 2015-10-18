//
//  ForecastPresenterProtocol.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

public protocol ForecastPresenterProtocol {
    func setView(view: ForecastViewProtocol) -> ()
    func updateForecast() -> ()
}
