//
//  XCTestCase+extension.swift
//  ToDoTests
//
//  Created by 홍석현 on 9/18/24.
//

import Foundation
import XCTest
import Combine

extension XCTestCase {
    func wait<T: Publisher>(
        for publisher: T,
        afterChange change: () -> Void,
        file: StaticString = #file,
        line: UInt = #line
    ) throws -> T.Output where T.Failure == Never {
        let publisherExpectation = expectation(
            description: "\(#file)에서 퍼블리셔를 기다립니다."
        )
        
        var result: T.Output?
        let token = publisher
            .dropFirst()
            .sink { value in
                result = value
                publisherExpectation.fulfill()
            }
        change()
        wait(for: [publisherExpectation], timeout: 1)
        token.cancel()
        let unwrappedResult = try XCTUnwrap(
            result,
            "Publisher는 어떤 값도 발행하지 않았다.",
            file: file,
            line: line
        )
        
        return unwrappedResult
    }
}
