//
//  HashSet+ArrayTests.swift
//  SwiftDSA
//
//  Created by Mithlesh Kumar Jha on 28/10/25.
//

import Testing
@testable import SwiftDSA

struct HashSetArrayTests {
    @Test("longestConsecutiveSequenceLength")
    func testLongestConsecutiveSequenceLength() async throws {
        /// Empty array, expected length = 0
        #expect(HashSetArrayProblems.longestConsecutiveSequenceLength([]) == 0)
        
        #expect(HashSetArrayProblems.longestConsecutiveSequenceLength([1,2,3,4]) == 4)
        
        #expect(HashSetArrayProblems.longestConsecutiveSequenceLength([4,3,2,1,5]) == 5)
        
        #expect(HashSetArrayProblems.longestConsecutiveSequenceLength([1,3,5,6]) == 2)
        
        #expect(HashSetArrayProblems.longestConsecutiveSequenceLength([1,3,5,7]) == 1)
    }
}
