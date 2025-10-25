//
//  Queue.swift
//
//  Created by Mithlesh Kumar Jha on 24/10/25.
//

import Foundation

/*
 Queue class implements Queue data structure
 dequeue is amortised O(1). All other operations are O(1)
 */

public struct Queue<T>: QueueInterface {
    private var inbox: [T] = [T]()
    private var outbox: [T] = [T]()
    
    // Adds a new element to the queue in FIFO fashion
    mutating func enqueue(_ value: T) -> Bool {
        inbox.append(value)
        return true 
    }
    
    // Removes and returns the next available element as FIFO
    // Complexity - Amortized O(1) per operation
    mutating func dequeue() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }
    
    // Returns first element of queue without removing it.
    func peek() -> T? {
        return outbox.last ?? inbox.first
    }
    
    func isEmpty() -> Bool {
        outbox.isEmpty && inbox.isEmpty
    }
    
    func count() -> Int {
        outbox.count + inbox.count
    }
}


extension Queue: Sendable where T: Sendable {}
