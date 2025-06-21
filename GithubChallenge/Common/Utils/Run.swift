//
//  Run.swift
//  GithubChallenge
//
//  Created by apple on 17/06/2025.
//

import Foundation

typealias SimpleCall = () -> Void

final class Run {
    
    static func onMainThread(after delay: Double = 0, closure: @escaping () -> Void) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    
    @discardableResult
    static func delayed(_ delayInSeconds: Double, block: @escaping SimpleCall) -> SimpleCall? {
        
        var isCancelled = false
        let canceller: SimpleCall = {
            isCancelled = true
        }
        
        let time = DispatchTime.now() + Double(Int64(delayInSeconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        
        DispatchQueue.main.asyncAfter(deadline: time) {
            if !isCancelled {
                block()
            }
        }
        return canceller
    }
}
