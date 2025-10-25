//
//  QueueInterface.swift
//  Queue
//
//  Created by Mithlesh Kumar Jha on 24/10/25.
//

protocol QueueInterface {
    associatedtype T
    
    mutating func enqueue(_ value: T) -> Bool
    
    // Removes and returns the next available element as FIFO
    mutating func dequeue() -> T?
    
    // Returns first element of queue without removing it.
    func peek() -> T?
    
    func isEmpty() -> Bool
    
    func count() -> Int 
}

protocol DequeueInterface {
    associatedtype T
    
    mutating func insertFront(_ value: T) -> Bool
    mutating func insertRear(_ value: T) -> Bool
    mutating func deleteFront() -> T?
    mutating func deleteRear() -> T?
    
    func front() -> T?
    func rear() -> T?
    
    func isEmpty() -> Bool
    func isFull() -> Bool
}
