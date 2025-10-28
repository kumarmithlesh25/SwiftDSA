//
//  HashmapProblems.swift
//  SwiftDSA
//
//  Created by Mithlesh Kumar Jha on 27/10/25.
//

final class HashmapProblems {}


extension HashmapProblems {
    /*
     Write an algorithm to determine if a number is a happy number.

     A happy number is defined by this process:

     Start with any positive integer.

     Replace the number by the sum of the squares of its digits.

     Repeat the process until the number equals 1 (it’s happy), or it loops endlessly in a cycle (not happy).
     */
    class func isHappyNumber(_ n: Int) -> Bool {
        // Check if the number is negative, return false
        guard n > 0 else { return false }
        
        // To determine loop, at every stage, we check if the number formed by adding squares is already visited. If yes, there's a cycle.
        var visited = Set<Int>()
        
        func sumOfSquaresOfDigits(num: Int) -> Int  {
            var number = num
            
            var sum = 0
            while number > 0 {
                let lastDigit = number % 10
                sum += lastDigit * lastDigit
                number /= 10
            }
            
            return sum
        }
        
        var num = n
        
        while num != 1 {
            if visited.contains(num) {
                return false
            }
            
            visited.insert(num)
            num = sumOfSquaresOfDigits(num: num)
        }
        
        return true

    }
}

// MARK: - Top K Frequent elements of array
/// We are given an array of hashable elements. Find top k frequent elements in the array. If one of more elements have same frequency, return either of the element.
/// e.g. [1,1,1,2,2,3,2,3,3,3] and K = 2 -> [3, 2] (3 has frequency 4 followed by 2 (or 1)
/// e.g. [], K = 1 -> []
extension HashmapProblems {
    class func findTopFrequentElements<E>(count: Int, input: [E]) -> [E] where E: Hashable {
        guard count > 0, !input.isEmpty else {
            return []
        }
        
        /// Step 1
        /// Create a hashmap of count of every element in the input array.
        var map = [E:Int]()
        
        for element in input {
            map[element, default: 0] += 1
        }
        
        /// Now that we have mapping of elements and their counts, lets use bucket sort to store elements with count in sorted order
        /// buckets contains array of input elements as elements and index of bucket is the count of those elements
        var buckets = Array(repeating: [E](), count: input.count + 1)
        for (element, freq) in map {
            buckets[freq].append(element)
        }
        
        var result = [E]()
        /// Traverse through buckets array from end
        for freq in stride(from: buckets.count - 1, to: 0, by: -1) {
            /// For each element found in the bucket for given frequency, add it to the result array
            for element in buckets[freq] {
                result.append(element)
                
                /// Break out once we have accumulated enough elements with highest frequency
                if result.count == count {
                    break
                }
            }
            
            if result.count == count { break }
        }
        
        return result
    }
}

