//
//  HashMap+Array.swift
//  DSDemo
//
//  Created by Mithlesh Kumar Jha on 24/10/25.
//

/*
 Subarray Sum Equals K
 
 Given an integer array nums and an integer k,
 return the total number of subarrays whose sum equals k.
 
 */
final class HashMapArrayProblems {
    class func numberOfSubsequencesWithSum(_ sum: Int, nums: [Int]) -> Int {
        /*
         We'll use hashmap and cumulative sum (prefix sum) to determine number of subarrays with sum equal to k
         
         e.g. nums = [3, 4, -7, 1, 3, 3, 1, -4]
         k = 7
         
         Subarrays are {[3,4], [3,4,-7,1,3,3], [1,3,3], [3,3,1]}
         
         Step    num    prefixSum    prefixSum - k    prefixSums                        count
         1          3    3              -4              {0:1, 3:1}                      0
         2          4    7              0               {0:1, 3:1, 7:1}                 ✅ +1 → 1
         3          -7   0              -7               {0:2, 3:1, 7:1}                1
         4          1    1              -6               {0:2, 3:1, 7:1, 1:1}           1
         5          3    4              -3               {0:2, 3:1, 7:1, 1:1, 4:1}      1
         6          3    7              0               {0:2, 3:1, 7:2, 1:1, 4:1}       ✅ +2 → 3
         7          1    8              1               {0:2, 3:1, 7:2, 1:1, 4:1, 8:1}  ✅ +1 → 4
         8          -4   4              -3               {0:2, 3:1, 7:2, 1:1, 4:2, 8:1}  4
         */
        var count = 0
        var prefixSums = [0: 1] // prefixsum:frequency 0 is seen once, base case.
        var prefixSum = 0
        
        for num in nums {
            prefixSum += num
            
            if let frequency = prefixSums[prefixSum - sum] {
                count += frequency
            }
            
            prefixSums[prefixSum, default: 0] += 1
        }
        
        return count
    }

}

