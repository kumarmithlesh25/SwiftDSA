// The Swift Programming Language
// https://docs.swift.org/swift-book


// MARK: - Stack

public struct Stack<Element> {
    var elements: [Element] = []
    
    mutating func push(_ element: Element) {
        elements.append(element)
    }
    
    mutating func pop() -> Element {
        return elements.removeLast()
    }
}

extension Stack {
    var top: Element? {
        return elements.last
    }
}
