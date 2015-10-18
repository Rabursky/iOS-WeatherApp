//
//  InteractorProtocol.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 18/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

enum InteractorError : ErrorType {
    case InputDataMissing
}

public protocol InteractorProtocol {
    func execute() throws
}
