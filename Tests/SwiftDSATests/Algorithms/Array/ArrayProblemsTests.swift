import Testing
@testable import SwiftDSA

@Test func testMergeRanges() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let emptyRange: [ClosedRange<Int>] = []
    let result = ArrayProblems.mergeIntervals(emptyRange)
    #expect(result == [], "Empty range merged to empty range")
    
    let singleRange: [ClosedRange<Int>] = [1...10]
    #expect(ArrayProblems.mergeIntervals(singleRange) == singleRange, "Single range merged to same range")
    
    let bigRangeCoveringAll: [ClosedRange<Int>] = [1...10, 2...3, 4...5, 5...7, 8...10]
    #expect(ArrayProblems.mergeIntervals(bigRangeCoveringAll) == [1...10], "Single range merged to same range")
    
    let mixedRange: [ClosedRange<Int>] = [1...5, 1...4, 2...3, 9...10, 4...8]
    #expect(ArrayProblems.mergeIntervals(mixedRange) == [1...8, 9...10], "Single range merged to same range")
}
