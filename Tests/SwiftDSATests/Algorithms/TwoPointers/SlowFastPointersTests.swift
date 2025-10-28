//
//  SlowFastPointersTests.swift
//  SwiftDSA
//
//  Created by Mithlesh Kumar Jha on 18/09/25.
//

import Testing

@testable import SwiftDSA

struct SlowFastPointersTests {
    
    @Test func testHappyNumber() async throws {
        var result = SlowFastPointerSolutions.isHappyNumber(12)
        #expect(result == false, "12 is not a happy number")
        
        result = SlowFastPointerSolutions.isHappyNumber(5555)
        #expect(result == true, "5555 is a happy number")
        
        #expect(SlowFastPointerSolutions.isHappyNumber(10) == true, "10 is a happy number")
        #expect(SlowFastPointerSolutions.isHappyNumber(1) == true, "1 is a happy number")
        #expect(SlowFastPointerSolutions.isHappyNumber(100) == true, "100 is a happy number")
        #expect(SlowFastPointerSolutions.isHappyNumber(68) == true, "68 is a happy number")
        #expect(SlowFastPointerSolutions.isHappyNumber(12) == false, "12 is a not happy number")
        #expect(SlowFastPointerSolutions.isHappyNumber(-1) == false, "-1 is a not happy number")
        #expect(SlowFastPointerSolutions.isHappyNumber(0) == false, "0 is a not happy number")
    }
    
    @Test("Verify first duplicate number in an array")
    func testDuplicate() async throws {
        #expect(SlowFastPointerSolutions.findDuplicate([1, 2, 3, 4, 5, 4, 6, 7]) == 4, "4 is the first duplicate element")
        #expect(SlowFastPointerSolutions.findDuplicate([1, 2, 3, 4, 5, 6, 7, 1]) == 1, "1 is the first duplicate element")
        #expect(SlowFastPointerSolutions.findDuplicate([1, 1, 3, 4, 5, 2, 6, 7]) == 1, "1 is the first duplicate element")
        #expect(SlowFastPointerSolutions.findDuplicate([1, 2, 1, 4, 5, 4, 6, 7]) == 1, "4 is the first duplicate element")
        #expect(SlowFastPointerSolutions.findDuplicate([1, 2, 3, 4, 4, 5, 6, 7]) == 4, "4 is the first duplicate element")
        #expect(SlowFastPointerSolutions.findDuplicate([7,6,5,4,3,2,7,1]) == 7, "7 is the first duplicate element")
        #expect(SlowFastPointerSolutions.findDuplicate([1,1]) == 1, "1 is the first duplicate element")
    }
}
