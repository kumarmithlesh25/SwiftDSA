//
//  HashSet+Array.swift
//  DSDemo
//
//  Created by Mithlesh Kumar Jha on 24/10/25.
//

final class HashSetArrayProblems {
    /*
     Given an unsorted array of integers, find the length of the longest consecutive elements sequence.

     Time Complexity: O(n) .
     Constraints:
     
     0 <= nums.count <= 10^5
     -10^9 <= nums[i] <= 10^9
     
     Example:
     [100, 4, 200, 1, 3, 2]
     Return - 4 ([1,2,3,4])
     Return 0 if input array is empty
     
     [100, 4, 200, 1, 3, 2, 87,86,85,84,83]
     */

    class func longestConsecutiveSequenceLength(_ nums: [Int]) -> Int {
        /// We'll use set to check if a consecutive element exists for a given element of input array.
        /// Repeat this until end of array
        
        guard !nums.isEmpty else { return 0 }
        
        // First remove duplicates and add numbers to a set which makes lookup of a number in O(1)
        let set = Set<Int>(nums)
        var maxLength = 1
        
        for num in set {
            /// Start checking for consecutive numbers from the smallest only.
            /// e.g. for array [4, 3, 2, 1], we always start checking for consecutive numbers from the lowest of those. In this case, we start checking when we reach 1.
            if !set.contains(num - 1) {
                var currentNum = num
                var currentLength = 1
                
                while set.contains(currentNum + 1) {
                    currentNum = currentNum + 1
                    currentLength += 1
                }
                
                maxLength = max(maxLength, currentLength)
            }
        }
        
        return maxLength
    }

}

