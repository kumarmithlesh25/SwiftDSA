// The Swift Programming Language
// https://docs.swift.org/swift-book
// Hi

class StringProblems {
    //  Given a string containing only `'('`, `')'`, `'{'`, `'}'`, `'['`, `']'`, determine if it is valid parentheses.
    /*
     Problem Definition

     You’re given a string containing only brackets:

     '(', ')'

     '{', '}'

     '[', ']'

     Return true if the string is valid. Otherwise, return false.

     A string is valid if:

     Open brackets must be closed by the same type of brackets.

     Open brackets must be closed in the correct order.

     Every closing bracket has a corresponding opening bracket before it.

     Examples
     Input: "()"         → true
     Input: "()[]{}"     → true
     Input: "(]"         → false
     Input: "([)]"       → false
     Input: "{[]}"       → true
     Input: ""           → true  (empty string is valid)
     */
    public class func isValidParenthesisString(_ input: String) -> Bool {
        let parenthesisMap: [Character: Character] = ["{": "}", "(":")", "[":"]"]
        var closingBraceStack = Stack<Character>()
        
        for character in input {
            /// If the character is an opening brace
            if let closing = parenthesisMap[character] {
                /// Push corresponding closing brace to the stack
                closingBraceStack.push(closing)
            } else {
                /// If not starting brace, the stack must have a close brace pushed into it earlier, otherwise return false.
                guard let expected = closingBraceStack.pop(),
                      expected == character  else {
                    return false
                }
            }
        }
        
        /// Check any pending open brace
        return closingBraceStack.top == nil
    }
}

