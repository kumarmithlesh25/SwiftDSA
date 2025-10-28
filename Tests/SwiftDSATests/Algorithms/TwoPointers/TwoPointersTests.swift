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
    
    // MARK: Benchmarking tests
    func test_longest_substring_benchmark() {
        //scalingBenchmark()
    }
}


extension TwoPointersTests {
    func scalingBenchmark() {
        for size in [1_000, 10_000, 100_000, 1_000_000, 10_000_000] {
            let input = generateQuadraticWorstCaseInput(n: 10)
            let string = String(repeating: input, count: size)
            Benchmark.benchmark(name: "Longest Substring \(size) chars", runs: 3) {
                _ = TwoPointersSolution.longestSubstringWithNonRepeatingCharacters(string)
            }
            print("----")
        }
    }
    
    /// Generate a string designed to trigger O(n^2) behavior
    /// Example: for n=6 → "abcdefa"
    func generateQuadraticWorstCaseInput(n: Int) -> String {
        // Create n-1 unique characters (cycling through Unicode scalars)
        let chars = (0..<(n - 1)).map { i in
            Character(UnicodeScalar(65 + (i % 26))!) // A, B, C, ...
        }
        // Append a duplicate of the *first* character at the end
        return String(chars) + String(chars.first!)
    }
}
