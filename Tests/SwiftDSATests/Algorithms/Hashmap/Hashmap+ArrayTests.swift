//
//  Hashmap+ArrayTests.swift
//  SwiftDSA
//
//  Created by Mithlesh Kumar Jha on 28/10/25.
//

import Testing
@testable import SwiftDSA


struct HashmapArrayTests {
    @Test("numberOfSubsequencesWithSum")
    func testSubsequencesCountWithSum() async throws {
        /// Subarrays are {[3,4], [3,4,-7,1,3,3], [1,3,3], [3,3,1]}
        #expect(HashMapArrayProblems.numberOfSubsequencesWithSum(7, nums: [3, 4, -7, 1, 3, 3, 1, -4]) == 4)
        
        /// No subarray with sum 0
        #expect(HashMapArrayProblems.numberOfSubsequencesWithSum(0, nums: [3]) == 0)
        
        /// 1 subarray with sum 0
        #expect(HashMapArrayProblems.numberOfSubsequencesWithSum(0, nums: [3, 4, -7]) == 1)
    }
}
