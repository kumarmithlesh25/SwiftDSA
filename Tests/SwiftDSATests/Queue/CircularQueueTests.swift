//
//  CircularQueueTests.swift
//
//  Created by Mithlesh Kumar Jha on 25/10/25.
//

@testable import SwiftDSA
import XCTest

final class CircularQueueTests: XCTestCase {
    func testEnqueueDequeue() throws {
        let capacity = 10
        var queue = CircularQueue<Int>(capacity: capacity)
        
        for i in 1...10 {
            XCTAssertTrue(queue.enqueue(i))
        }
        
        /// Once queue is full, enqueue should not be allowed
        XCTAssertFalse(queue.enqueue(11))
        
        for i in 1...10 {
            XCTAssertEqual(queue.dequeue(), i)
        }
    }
    
    func testPeek() throws {
        let capacity = 10
        var queue = CircularQueue<Int>(capacity: capacity)
        
        _ = queue.enqueue(1)
        _ = queue.enqueue(11)
        
        /// Front of queue should be 1
        XCTAssertEqual(queue.peek(), 1)
        
        /// Remove 1
        _ = queue.dequeue()
        
        /// Front of the queue should now be 11
        XCTAssertEqual(queue.peek(), 11)
        
        _ = queue.dequeue()
        
        XCTAssertNil(queue.peek())
    }
    
    func testIsEmpty() throws {
        let capacity = 10
        var queue = CircularQueue<Int>(capacity: capacity)
        
        XCTAssertTrue(queue.enqueue(1))
        XCTAssertTrue(queue.enqueue(2))

        _ = queue.peek()
        _ = queue.peek()
        XCTAssertFalse(queue.isEmpty())
        
        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.dequeue(), 2)
        XCTAssertTrue(queue.isEmpty())
    }
    
    func testCount() throws {
        let capacity = 10
        var queue = CircularQueue<Int>(capacity: capacity)
        
        _ = queue.enqueue(1)
        XCTAssertEqual(queue.count(), 1)
        
        _ = queue.peek()
        // Peek shouldn't remove element
        XCTAssertEqual(queue.count(), 1)
        
        _ = queue.dequeue()
        XCTAssertEqual(queue.count(), 0)
        
        _ = queue.enqueue(2)
        _ =  queue.enqueue(3)
        _ = queue.enqueue(4)
        XCTAssertEqual(queue.count(), 3)
        
        _ = queue.dequeue()
        XCTAssertEqual(queue.count(), 2)
    }
}

