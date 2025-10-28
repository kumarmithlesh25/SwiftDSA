//
//  Slow-FastPointers.swift
//  DSDemo
//
//  Created by Mithlesh Kumar Jha on 18/09/25.
//
// Slow & Fast pointer method addresses extra space avoidance issue found in hashing based solutions.

class SlowFastPointerSolutions {
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
        
        func sumOfSquareOfDigits(_ number: Int) ->Int {
            var sum = 0
            var num = number
            while num > 0 {
                let remainder = num % 10
                num = num / 10
                sum += remainder * remainder
            }
            
            return sum 
        }
        
        // 12 -> 5 -> 25 -> 29 -> 85 -> 89 -> 145 -> 42 -> 20 -> 4 -> 16 -> 37 ->58 -> 89 (cycle)
        // 17 -> 50 ->25 -> 29 ....
        // 241 -> 21 -> 5
        // 5555 -> 100 -> 1 - Happy Number
        var slow = n
        var fast = sumOfSquareOfDigits(n)
        
        while fast != 1 && slow != fast {
            slow = sumOfSquareOfDigits(slow)
            fast = sumOfSquareOfDigits(sumOfSquareOfDigits(fast))
        }
        
        return fast == 1
    }
}

extension SlowFastPointerSolutions {
    /*
     Problem Restatement

     Input: An array nums of length n+1, where each integer is between 1 and n (inclusive).

     Guarantee: At least one number is duplicated (could be more).

     Task: Find any duplicate without modifying the array and using only O(1) extra space.
     */
    class func findDuplicate(_ nums: [Int]) -> Int {
        
        /*
         
         Solved using Floyd's cycle detection algorithm.
         
         // nums = [1, 2, 3, 4, 5,6,7,8,1]
         index:   0  1  2  3  4 5 6 7 8
         value:   1  2  3  4  5 6 7 8 1
         
         The list formed by referring value at an index is pointer to next node of a linked list, we get
         0->1->2->3->4->5->6->7->8->(cycle starts here)1->2->3->4->5->6->7->8
         
         */
        
        /// Step 1 - Find the intersection inside the cycle
        /// Use slow and fast pointers from beginning. Fast pointer moves twice as fast as slow pointer. They will meet inside the cycle but not necessarily beginning of the cycle.
        
        var slow = nums[0]
        var fast = nums[0]
        
        repeat {
            slow = nums[slow]
            fast = nums[nums[fast]]
        } while slow != fast
        
        /// Step 2 - Find entrance of the cycle - The entrance of the cycle is at a distance from start of the list which is equal to  that when divided by the length of the cycle, always leave remainder equal to the remaining distance of the cycle from meeting point.
        
        slow = nums[0]
        while slow != fast {
            slow = nums[slow]
            fast = nums[fast]
        }
        
        return slow
    }
}
