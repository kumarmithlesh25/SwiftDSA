//
//  Dequeue.swift
//  Queue
//
//  Created by Mithlesh Kumar Jha on 25/10/25.
//

/*
    Dequeue implements DequeueInterface
 */

public struct Dequeue<T>: DequeueInterface {
    
    private var elements: [T?]
    private var head: Int = 0
    private var tail: Int = 0 
    private var count: Int = 0
    
    private let capacity: Int
    
    private var empty: Bool { count == 0 }
    private var full: Bool { capacity == count }
    
    public init(capacity: Int) {
        precondition(capacity > 0, "Dequeue capacity must be positive")
        
        self.capacity = capacity
        self.elements = Array(repeating: nil, count: capacity)
    }
    
    
    mutating func insertFront(_ value: T) -> Bool {
        guard !full else { return false }
        
        head = (head - 1 + capacity) %  capacity
        elements[head] = value
        count += 1
        
        return true
    }
    
    mutating func insertRear(_ value: T) -> Bool {
        guard !full else { return false }
        
        elements[tail] = value
        tail = (tail + 1) % capacity
        count += 1
        
        return true
    }
    
    mutating func deleteFront() -> T? {
        guard !empty else { return nil }

        let value = elements[head]
        elements[head] = nil
        head = (head + 1) % capacity
        count -= 1
        
        return value
    }
    
    mutating func deleteRear() -> T? {
        guard !empty else { return nil }
        
        let newTail = (tail - 1 + capacity) %  capacity
        
        let value = elements[newTail]
        elements[newTail] = nil
        tail = newTail
        count -= 1
        
        return value
    }
    
    func front() -> T? {
        return elements[head]
    }
    
    func rear() -> T? {
        return elements[(tail - 1 + capacity) %  capacity]
    }
    
    func isEmpty() -> Bool {
        return empty
    }
    
    func isFull() -> Bool {
        return full
    }

}

extension Dequeue: CustomStringConvertible {
    public var description: String {
        let validElements = (0..<count).map {
            elements[(head + $0) % capacity]
        }
        return "Valid Elements \(validElements)"
    }
}


extension Dequeue: Sendable where T: Sendable {}
