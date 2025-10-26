import XCTest
@testable import SwiftDSA

final class TwoPointersTests: XCTestCase {
    
    func testLongestSubstring() {
        let string1 = "abcd"
        XCTAssertEqual(string1, TwoPointersSolution.longestSubstringWithNonRepeatingCharacters(string1))
        
        let string2 = "bbbbb"
        XCTAssertEqual("b", TwoPointersSolution.longestSubstringWithNonRepeatingCharacters(string2))
        
        let string3 = "bbbbc"
        XCTAssertEqual("bc", TwoPointersSolution.longestSubstringWithNonRepeatingCharacters(string3))

        //abcabcaa => abc
        let string4 = "abcabcaa"
        XCTAssertEqual("abc", TwoPointersSolution.longestSubstringWithNonRepeatingCharacters(string4))
        
        //abcdefghijklmnopqabcdefghijklmnopqra => abcdefghijklmnopqr
        
        let string5 = "abcdefghijklmnopqabcdefghijklmnopqra"
        XCTAssertEqual("abcdefghijklmnopqr", TwoPointersSolution.longestSubstringWithNonRepeatingCharacters(string5))

        //abcade -> bcade
        let string6 = "abcade"
        XCTAssertEqual("bcade", TwoPointersSolution.longestSubstringWithNonRepeatingCharacters(string6))
        
        // pqraebaeaeabcdefg => abcdefg
        let string7 = "pqraebaeaeabcdefg"
        XCTAssertEqual("abcdefg", TwoPointersSolution.longestSubstringWithNonRepeatingCharacters(string7))

    }
    
    func testPalindrome() throws {
        XCTAssertTrue(TwoPointersSolution.checkPalindrome("A man, a plan, a canal: Panama"))
        XCTAssertFalse(TwoPointersSolution.checkPalindrome("Knife"))
        XCTAssertTrue(TwoPointersSolution.checkPalindrome(""))
    }
    
    func testReverseStrig() throws  {
        var text = "abc"
        TwoPointersSolution.reverseString(&text)
        XCTAssertEqual(text, "cba")
        
        text = ""
        XCTAssertEqual(text, "")
        
        text = "Cafe\u{0301}"
        TwoPointersSolution.reverseString(&text)
        XCTAssertEqual(text, "e\u{0301}faC")
    }
}
