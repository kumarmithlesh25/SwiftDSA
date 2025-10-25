//
//  CircularQueue.swift
//  Queue
//
//  Created by Mithlesh Kumar Jha on 25/10/25.
//

/*
 Circular queue provides same functionality as queue with efficient usage of available space.
 */
public struct CircularQueue<T> {
    private var elements: [T?] = []
    private var head: Int = 0
    private var tail: Int = 0
    
    private var elementsCount: Int = 0
    
    var isFull: Bool { elementsCount == capacity }
    var empty: Bool { elementsCount == 0 }
    
    private let capacity: Int
    public init(capacity: Int) {
        self.capacity = capacity
        elements = Array(repeating: nil, count: capacity)
    }
}

extension CircularQueue: QueueInterface {
    mutating func enqueue(_ value: T) -> Bool {
        /*
         if queue has not reached its capacity add an element to queue
         Added to the rear
         Adjust tail position, tail should move in circular fashion, move to 0 if in the end of the array
         update count
         */
        guard !isFull else { return false }
        elements[tail] = value
        tail = (tail + 1) % capacity
        elementsCount += 1
        return true
    }
    
    mutating func dequeue() -> T? {
        guard !empty else { return nil }
        /*
         Remove element at head
         Adjust head position to next in circular fashion
         update count
         return the element
         */
        let value = elements[head]
        elements[head] = nil
        head = (head + 1) % capacity
        elementsCount -= 1
        return value
    }
    
    func peek() -> T? {
        elements[head]
    }
    
    func isEmpty() -> Bool {
        return empty
    }
    
    func count() -> Int {
        elementsCount
    }
}

extension CircularQueue: Sendable where T: Sendable {}
