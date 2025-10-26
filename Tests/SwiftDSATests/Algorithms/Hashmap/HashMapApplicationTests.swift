//
//  HashMapApplicationTests.swift
//  SwiftDSA
//
//  Created by Mithlesh Kumar Jha on 27/10/25.
//

import XCTest
@testable import SwiftDSA

final class HashMapApplicationTests: XCTestCase {
    func testHappyNumber() throws {
        XCTAssertTrue(HashmapProblems.isHappyNumber(10))
        XCTAssertTrue(HashmapProblems.isHappyNumber(1))
        XCTAssertTrue(HashmapProblems.isHappyNumber(100))
        XCTAssertTrue(HashmapProblems.isHappyNumber(68))
        XCTAssertFalse(HashmapProblems.isHappyNumber(12))
        XCTAssertFalse(HashmapProblems.isHappyNumber(-1))
        XCTAssertFalse(HashmapProblems.isHappyNumber(0))
    }
}

