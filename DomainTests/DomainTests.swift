//
//  DomainTests.swift
//  DomainTests
//
//  Created by Marcin Rabursky on 17/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import XCTest
@testable import Domain

enum TestError : ErrorType {
    case Error
}

class DomainTests: XCTestCase {
    func AssertInteractorThrowsOnExecute(interactor: InteractorProtocol) {
        var theError: ErrorType?
        do {
            try interactor.execute()
        } catch let error {
            theError = error
        }
        XCTAssertNotNil(theError)
    }
    
}
