//
//  HashMapApplicationTests.swift
//  SwiftDSA
//
//  Created by Mithlesh Kumar Jha on 27/10/25.
//

import XCTest
@testable import SwiftDSA

final class HashMapProblemsTests: XCTestCase {
    func testHappyNumber() throws {
        XCTAssertTrue(HashmapProblems.isHappyNumber(10))
        XCTAssertTrue(HashmapProblems.isHappyNumber(1))
        XCTAssertTrue(HashmapProblems.isHappyNumber(100))
        XCTAssertTrue(HashmapProblems.isHappyNumber(68))
        XCTAssertFalse(HashmapProblems.isHappyNumber(12))
        XCTAssertFalse(HashmapProblems.isHappyNumber(-1))
        XCTAssertFalse(HashmapProblems.isHappyNumber(0))
    }
    
    func test_frequent_elements() {
        /// Verify top k frequently occurring elements in an array
        XCTAssertEqual(HashmapProblems.findTopFrequentElements(count: 0, input: [1,2]), [])
        XCTAssertEqual(HashmapProblems.findTopFrequentElements(count: 0, input: [0]), [])
        XCTAssertEqual(HashmapProblems.findTopFrequentElements(count: 1, input: [1]), [1])
        XCTAssertEqual(HashmapProblems.findTopFrequentElements(count: 2, input: [1,2,2]), [2,1])
        
        /// result requires top 3 elements. While the first two elements of result array are 3 and 2, the third element cannot be ascertained as 1, 4, 5, and 6 all qualify for element with frequency 1
        let result = HashmapProblems.findTopFrequentElements(count: 3, input: [1,2,2,3,4,5,6,3,3])
        
        XCTAssertEqual(result.count, 3)
        XCTAssertEqual(result[0], 3)
        XCTAssertEqual(result[1], 2)
    }
}

