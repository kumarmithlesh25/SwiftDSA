//
//  TwoPointers.swift
//  SwiftDSA
//
//  Created by Mithlesh Kumar Jha on 27/10/25.
//

import Foundation

public class TwoPointersSolution {
    
    /// determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
    /// Examples:
    ///
    /// "A man, a plan, a canal: Panama" → true

    /// "race a car" → false
    public static func checkPalindrome(_ text: String) -> Bool {
        
        /*
         Clean the string → remove non-alphanumeric + lowercase everything.
         Use two pointers:
            left at start, right at end.
            While left < right, compare characters.
            If mismatch → return false.
            Return true if all characters match.
         
         Time Complexity: O(n)
         Space Complexity: 1
         
         */
    
        let characters = Array(text.lowercased())
        var left = 0, right = characters.count - 1
        
        while left < right {
            if !characters[left].isLetter, !characters[left].isNumber {
                left += 1
                continue
            }
            
            if !characters[right].isLetter, !characters[right].isNumber {
                right -= 1
                continue
            }
            
            if characters[left] != characters[right] {
                return false
            }
            
            left += 1
            right -= 1
        }
        
        return true
    }
}


extension TwoPointersSolution {
    /// Write a function that reverses a string. The input string is given as an inout parameter.
    public static func reverseString(_ text: inout String)  {
        
        /*
         1) Start with two counters one from start and other from end,
         2) Swap characters
         
         Time Complexity: O(n)
         Space Complexity: 1
         
         */
        
        var array = Array(text)
        
        var left = 0
        var right = array.count - 1
        
        while left < right {
            let temp = array[left]
            
            array[left] = array[right]
            array[right] = temp
            
            left += 1
            right -= 1
        }
        
        text = String(array)
    }
}

extension TwoPointersSolution {
    // Given a string s, find the longest substring without repeating characters.
    /*
     abcabcaa => abc
     abcdefghijklmnopqabcdefghijklmnopqra => abcdefghijklmnopqr
     bbbbb -> b
     
     abcade -> bcade
     abcdefgcl
     abccl
     
     aeaeaeabcde
     pqraebaeaeabcdefg => abcdefg
     pqraeb (pqraeb, ebaeaeabcdefg, e)
     eba (eba,baeaeabcdefg, b)
     bae (bae, eaeabcdefg, e)
     ea (ea, aeabcdefg, a)
     ae (ae, eabcdefg, e)
     ea (ea, abcdefg, a)
     abcdefg
     
     */
    
    public static func longestSubstringWithNonRepeatingCharacters(_ input: String) -> String {
        /*
         Start scanning the string using two pointers:
         c
        1) As a pointer moves forward, store new character in a set of found characters. Continue to move forward unless first duplicate character is found. In every iteration, maxLength is taken for the characters between left and right indices and startIndexOfMax is set to left index.
        2) As first duplicate character is found, the left pointer moves to the next index of duplicate character,
        3) If the maxLength of the new substring is greater than previously saved maxLength, replace it with new maxLength and startIndexOfMax.
         
        4) Repeat steps 1 through 3
         
        5) Finally, create a substring from startIndexOfMax upto maxLength
        6) Return the substring
         
         */
        
        guard !input.isEmpty else { return input }
        let chars = Array(input)
        
        var seen = [Character: Int]()
        var left = 0
        var maxLength = 0
        var startIndexOfMax = 0
        
        for (right, char) in chars.enumerated() {
            if let prevIndex = seen[char], prevIndex >= left {
                left = prevIndex + 1
            }
            
            seen[char] = right
            if right - left + 1 > maxLength {
                maxLength = right - left + 1
                startIndexOfMax = left
            }
        }
        return String(chars[startIndexOfMax..<startIndexOfMax + maxLength])
    }
    
}
