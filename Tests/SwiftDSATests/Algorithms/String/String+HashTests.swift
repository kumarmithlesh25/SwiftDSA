//
//  String+HashTests.swift
//  StringProblems
//
//  Created by Mithlesh Kumar Jha on 27/10/25.
//

import XCTest
@testable import SwiftDSA

final class StringHashTests: XCTestCase {
    func testAnagram() throws {
        XCTAssertTrue(StringsHashSolutions.isAnagram("abc", "cab"))
        XCTAssertFalse(StringsHashSolutions.isAnagram("aa", "a"))
        XCTAssertTrue(StringsHashSolutions.isAnagram("anagram", "nagaram"))
    }
    
    func testFirstUniqueCharacter() throws {
        /*
         "leetcode" → 0 ('0')

         "loveleetcode" → 1 ('v')

         "aabb" → -1
         */
        
        XCTAssertEqual(StringsHashSolutions.firstUniqueCharacter("lemon"), 0)
        XCTAssertEqual(StringsHashSolutions.firstUniqueCharacter("lovelemon"), 2)
        XCTAssertEqual(StringsHashSolutions.firstUniqueCharacter("aabb"), -1)
    }
    
    func testIsomorphic() {
        /*
         s = "egg", t = "add" → true
         s = "foo", t = "bar" → false
         s = "paper", t = "title" → true
         */
        
        XCTAssertTrue(StringsHashSolutions.isIsomorphic("egg", "add"))
        XCTAssertTrue(StringsHashSolutions.isIsomorphic("paper", "title"))
        XCTAssertFalse(StringsHashSolutions.isIsomorphic("foo", "bar"))
        XCTAssertFalse(StringsHashSolutions.isIsomorphic("ab", "cc"))
    }
}
