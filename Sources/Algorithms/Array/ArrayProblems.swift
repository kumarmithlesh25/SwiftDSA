// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

class ArrayProblems {
    
    // You’re given a list of meeting time intervals.
    // Merge overlapping intervals and return the result.
    /*
     Input:

     [[1,3],[2,6],[8,10],[15,18]]


     Explanation:

     [1,3] and [2,6] overlap → merge into [1,6]

     [8,10] stays separate

     [15,18] stays separate

     Output:

     [[1,6],[8,10],[15,18]]
     */
    
    public static func sortIntervalsOnStartIndex(_ input: [ClosedRange<Int>]) -> [ClosedRange<Int>] {
        let sorted = input.sorted { (first, second) in
            first.startIndex < second.startIndex
        }
        
        return sorted
    }
    
    public static func mergeIntervals(_ input: [ClosedRange<Int>]) -> [ClosedRange<Int>]{
        guard input.count > 1 else { return input }
        
        /*
         Sort input based on start index of input ranges
         */
        
        let sorted = sortIntervalsOnStartIndex(input)
        
        var result = [ClosedRange<Int>]()
        
        /*
         Now traverse through sorted array, For each element
         - If its end index is greater than or equal to the start index of next range, they can merge. The new range starts at smaller of start indexes of the two intervals and end-index is the larger of indices of end index.
         -
         */
        
        var current = sorted[0]
        var next = 1
        
        while next < sorted.count {
            
            if current.upperBound >= sorted[next].lowerBound {
                let newEnd = max(current.upperBound, sorted[next].upperBound)
                current = current.lowerBound...newEnd
            } else {
                result.append(current)
                current = sorted[next]
            }
            
            next += 1
        }
        
        result.append(current)
        
        return result
    }
}
