//
//  XCTestAysncExpectation.swift
//  Unit Tests
//
//  Created by https://www.vadimbulavin.com/swift-asynchronous-unit-testing-with-busy-assertion-pattern/
//

#if canImport(XCTest)
import XCTest

func XCTExpect(
    toEventually test: @autoclosure () -> Bool,
    timeout: TimeInterval = 1.0,
    message: String = "",
    file: StaticString = #file,
    line: UInt = #line
) {
    let runLoop = RunLoop.current
    let timeoutDate = Date(timeIntervalSinceNow: timeout)
    repeat {
        if test() {
            XCTAssertTrue(test(), file: file, line: line)
            return
        }
        runLoop.run(until: Date(timeIntervalSinceNow: 0.01))
    } while Date().compare(timeoutDate) == .orderedAscending
    
    XCTFail(message, file: file, line: line)
}

#endif
