//
//  InteractorInvokerProtocol.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 18/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import Domain

typealias InteractorInvokerCompletionBlock = (error: ErrorType?) -> ()
typealias InteractorInvokerCallBlock = () throws -> ()

protocol InteractorInvokerProtocol {
    func invoke(interactor: InteractorProtocol, completionBlock: InteractorInvokerCompletionBlock?) -> ()
    func invoke(callBlock: InteractorInvokerCallBlock, completionBlock: InteractorInvokerCompletionBlock?) -> ()
}
