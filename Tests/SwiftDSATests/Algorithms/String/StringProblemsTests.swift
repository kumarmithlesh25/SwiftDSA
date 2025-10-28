//
//  StringProblemsTests.swift
//  SwiftDSA
//
//  Created by Mithlesh Kumar Jha on 28/10/25.
//

import Testing
@testable import SwiftDSA

struct StringProblemsTests {
    
    @Test("isValidParenthesis")
    func testValidParenthesis() async throws {
        #expect(StringProblems.isValidParenthesisString("") == true, "Empty string is a valid parenthesis")
        #expect(StringProblems.isValidParenthesisString("()") == true, "() is a valid parenthesis")
        #expect(StringProblems.isValidParenthesisString("(){}") == true, "(){} is a valid parenthesis")
        #expect(StringProblems.isValidParenthesisString("(){}[]") == true, "(){}[] is a valid parenthesis")
        #expect(StringProblems.isValidParenthesisString("(())") == true, "(()) is a valid parenthesis")
        #expect(StringProblems.isValidParenthesisString("(({}))") == true, "(()) is a valid parenthesis")
        #expect(StringProblems.isValidParenthesisString("(({})){}") == true, "(({})){} is a valid parenthesis")
        
        #expect(StringProblems.isValidParenthesisString("{") == false, "{ is an invalid parenthesis")
        #expect(StringProblems.isValidParenthesisString("}") == false, "} is an invalid parenthesis")
        #expect(StringProblems.isValidParenthesisString("{(})") == false, "{(}) is an invalid parenthesis")
        #expect(StringProblems.isValidParenthesisString("(({)])") == false, "(({)]) is an invalid parenthesis")
        #expect(StringProblems.isValidParenthesisString("())") == false, "()) is an invalid parenthesis")
    }
}
