//
//  Strings+Hash.swift
//  StringProblems
//
//  Created by Mithlesh Kumar Jha on 16/09/25.
//

public class StringsHashSolutions {
    
    /*
     Given two strings s and t, return true if t is an anagram of s, otherwise false.
     An anagram = rearranging letters to form another word.

     Examples:

     s = "anagram", t = "nagaram" → true
     s = "rat", t = "car" → false
     */
    
    class func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        
        var hashMap = [Character: Int]()
        for char in s {

            hashMap[char, default: 0] += 1
        }
        
        for char in t {
            guard let count = hashMap[char] else { return false }
            if count == 1 {
                hashMap.removeValue(forKey: char)
            } else {
                hashMap[char] = count - 1
            }
        }
        
        return hashMap.isEmpty
    }
    
}

extension StringsHashSolutions {
    /*
     Problem:
     Given a string, return the index of the first non-repeating character. If none, return -1.

     Examples:

     "leetcode" → 0 ('l')

     "loveleetcode" → 2 ('v')

     "aabb" → -1
     */
    class func firstUniqueCharacter(_ s: String) -> Int {
        var charCountMap = [Character: Int]()
        for char in s {
            charCountMap[char, default: 0] += 1
        }
        
        for (index,char) in s.enumerated() {
            let count = charCountMap[char]
            if count == 1 {
                return index
            }
        }
        
        return -1
    }
}

extension StringsHashSolutions {
    /*
     Definition:
     Two strings s and t are isomorphic if the characters in s can be replaced to get t.

     Each character must map to exactly one character (one-to-one).

     No two characters in s can map to the same character in t.

     Examples:

     s = "egg", t = "add" → true

     s = "foo", t = "bar" → false

     s = "paper", t = "title" → true
     */
    class func isIsomorphic(_ s: String, _ t: String) -> Bool {
        /*
         Return false if inputs lengths are different
         
         // Traverse through chars of first string
         // map characters of first string with corresponding character of second string
         */
        
        guard s.count == t.count else { return false }
        
        // Hashmap to store mapping of characters of s to characters of t
        var sTot = [Character: Character]()
        var tToS = [Character: Character]()
        
        // Swift doesn't allow finding character at index from String. Let's convert it to an Array first.
        let sArr = Array(s)
        let tArr = Array(t)
        
        for i in 0..<sArr.count {
            let sChar = sArr[i]
            let tChar = tArr[i]
            
            if let mapping = sTot[sChar], mapping != tChar {
                return false
            }
            
            if let mapping = tToS[tChar], mapping != sChar {
                return false 
            }
            
            sTot[sChar] = tChar
            tToS[tChar] = sChar
        }
        
        return true
    }
}

extension StringsHashSolutions {
    /*
     Given an array of strings, group the anagrams together.
     You can return the answer in any order.
     
     Input: ["eat","tea","tan","ate","nat","bat"]
     Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
     */
    class func groupAnagrams1(_ strs: [String]) -> [[String]] {
        /*
         Brute force method.
         
         Complexity O(m^2 * k) where m is the length of input array and k is the length of strings in the input array.
         
         1) For each string in strs, find its anagrams and group in the results array.
         2) skip strings that are already included in a group as their anagram is already found
         3) Repeat until all strings are covered.
         
         */
        
        guard !strs.isEmpty else { return [[]] }
        
        var result = [[String]]()
        var visitedIndices = Set<Int>()
        
        for i in 0..<strs.count {
            if visitedIndices.contains(i) { continue }
            
            var group = [strs[i]]
            visitedIndices.insert(i)
            for j in i+1..<strs.count {
                if isAnagram(strs[i], strs[j]) {
                    visitedIndices.insert(j)
                    group.append(strs[j])
                }
            }
            
            result.append(group)
        }
        
        return result
    }
    
    // Improved version
    class func groupAnagrams2(_ strs: [String]) -> [[String]] {
        /*
         Each string is sorted first and then grouped based on if its sorted version exists in the group
         
         Complexity:
         Each sorting of string length k requires klogk multiplied by length of input array m. Overall runtime complexity is m*klogk
         Space
         O m * k
         */
        
        var groups = [String: [String]]()
        
        for word in strs {
            let sorted = String(word.sorted())
            groups[sorted, default: []].append(word)
        }
        
        return Array(groups.values)
    }
    
    // Improved version - Assumes every character is an ascii small case character.
    class func groupAnagrams3(_ strs: [String]) -> [[String]] {
        /*
         An array of length 26 is used as key with value as array of strings
         The array contains element as 0 or count of character on the index whose characters are found in every word of input strs.
         
         Time Complexity:
         m * k - where m is the length of input array and k is the length of string
         
         This requires additional space complexity
         O (m * k) (for values in groups) + 26 * number of entries in groups (variable, depends upon input strings)
         */
        
        var groups = [[Int]: [String]]()
        
        for word in strs {
            var asciiArray = Array(repeating: 0, count: 26)
            for char in word {
                let index = Int(char.asciiValue! - Character("a").asciiValue!)
                asciiArray[index] += 1
            }
            
            groups[asciiArray, default: []].append(word)
        }
        
        return Array(groups.values)
    }
    
    // Improved version - Generalized that works for any character set
    class func groupAnagrams4(_ strs: [String]) -> [[String]] {
        /*
            In this solution, it is assumed that characters can be a non-ascii characters. We maintain a hashmap of every character with its count in the words.
         This hashmap is used as a key to the final group
         So, "e❤️t", "❤️te" strings map to [e:1, t:1, ❤️:1].
         This dictionary is used as a key when deciding whether two strings form anagram or not.
         */
        
        var groups = [[Character: Int]: [String]]()
        
        for word in strs {
            var charMap = [Character:Int]()
            for char in word {
                charMap[char, default: 0] += 1
            }
            
            groups[charMap, default: []].append(word)
        }
        
        return Array(groups.values)
    }
        
}



