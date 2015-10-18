//
//  InteractorInvokerTestCase.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 18/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import XCTest
import Domain

enum TestError : ErrorType {
    case Error
}

class InteractorMock : InteractorProtocol {
    var throwsError: Bool = false
    var block: (() -> ())?
    func execute() throws {
        if throwsError {
            throw TestError.Error
        }
        if let block = block {
            block()
        }
    }
}

class InteractorInvokerTestCase: XCTestCase {
    var invoker: InteractorInvokerProtocol!

    override func setUp() {
        super.setUp()
        invoker =  InteractorInvoker()
    }
    
    func testExecutesInteractorBlock() {
        let interactorExecuteExpectation = expectationWithDescription("Should execute Interactor")
        
        let interactor = InteractorMock()
        interactor.block = { () -> () in
            interactorExecuteExpectation.fulfill()
        }
        invoker.invoke(interactor, completionBlock: nil)
        waitForExpectationsWithTimeout(1, handler: nil)
    }
    
    func testExecutesCompletionBlockWhenProvidedAndNoError() {
        let interactorCompletionExpectation = expectationWithDescription("Should execute Interactor")

        let interactor = InteractorMock()
        invoker.invoke(interactor) { (error: ErrorType?) -> () in
            XCTAssertNil(error)
            interactorCompletionExpectation.fulfill()
        }
        waitForExpectationsWithTimeout(1, handler: nil)
    }

    func testExecutesCompletionBlockWhenProvidedWithError() {
        let interactorCompletionExpectation = expectationWithDescription("Should execute Interactor")

        let interactor = InteractorMock()
        interactor.throwsError = true
        invoker.invoke(interactor) { (error: ErrorType?) -> () in
            XCTAssertNotNil(error)
            interactorCompletionExpectation.fulfill()
        }
        waitForExpectationsWithTimeout(1, handler: nil)
    }
}
