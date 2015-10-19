//
//  Invoker.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 18/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import Domain
import SwiftyDispatch

class InteractorInvoker : InteractorInvokerProtocol {
    let queue = NSOperationQueue()
    
    func invoke(interactor: InteractorProtocol, completionBlock: InteractorInvokerCompletionBlock?) {
        self.invoke({ () -> () in
            try interactor.execute()
        }, completionBlock: completionBlock)
    }
    
    func invoke(callBlock: InteractorInvokerCallBlock, completionBlock: InteractorInvokerCompletionBlock?) -> () {
        queue.addOperationWithBlock { () -> () in
            do {
                try callBlock()
                Queue.main().async({ () -> Void in
                    completionBlock?(error: nil)
                })
            } catch let error {
                Queue.main().async({ () -> Void in
                    completionBlock?(error: error)
                })
            }
        }
    }
}
