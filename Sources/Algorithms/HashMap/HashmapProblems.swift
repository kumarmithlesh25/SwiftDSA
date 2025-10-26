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

