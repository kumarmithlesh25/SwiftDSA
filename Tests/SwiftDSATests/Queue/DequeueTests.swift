//
//  DequeueTests.swift
//
//  Created by Mithlesh Kumar Jha on 25/10/25.
//

@testable import SwiftDSA
import XCTest

final class DequeueTests: XCTestCase {
    
    override func setUp() async throws {
        try await super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_insert_front() {
        let capacity = 10
        var queue = Dequeue<Int>(capacity: capacity)
        
        for i in 0..<capacity {
            XCTAssertTrue(queue.insertFront(i))
            
            // Verify element inserted to front is indeed the one in the front
            XCTAssertEqual(queue.front(), i)
        }
        
        // Verify the last element of queue is 0
        XCTAssertEqual(queue.rear(), 0)
        
        // Verify new elements can't be inserted once the queue reaches its capacity.
        XCTAssertFalse(queue.insertFront(capacity))

    }
    
    func test_insert_rear() {
        let capacity = 10
        var queue = Dequeue<Int>(capacity: capacity)
        
        for i in 0..<capacity {
            XCTAssertTrue(queue.insertRear(i))
            
            // Verify element inserted to end is indeed the one in the end
            XCTAssertEqual(queue.rear(), i)
        }
        
        // Verify the first element of queue is 0
        XCTAssertEqual(queue.front(), 0)
        
        // Verify new elements can't be inserted once the queue reaches its capacity.
        XCTAssertFalse(queue.insertRear(capacity))
        
        
        let description = queue.description
        XCTAssertEqual(description, "Valid Elements [Optional(0), Optional(1), Optional(2), Optional(3), Optional(4), Optional(5), Optional(6), Optional(7), Optional(8), Optional(9)]")
    }
    
    func test_insert_front_delete_front() {
        let capacity = 10
        var queue = Dequeue<Int>(capacity: capacity)
        
        for i in 0..<capacity {
            XCTAssertTrue(queue.insertFront(i))
        }
        
        XCTAssertTrue(queue.isFull())
        
        // Verify new elements can't be inserted once the queue reaches its capacity.
        XCTAssertFalse(queue.insertFront(capacity))
        
        for i in 0..<capacity {
            XCTAssertEqual(queue.deleteFront(), capacity - 1 - i)
        }
        
        XCTAssertTrue(queue.isEmpty())
        
        XCTAssertNil(queue.deleteRear())
    }
    
    func test_insert_front_delete_rear() {
        let capacity = 10
        var queue = Dequeue<Int>(capacity: capacity)
        
        for i in 0..<capacity {
            XCTAssertTrue(queue.insertFront(i))
        }
        
        XCTAssertTrue(queue.isFull())
        
        // Verify new elements can't be inserted once the queue reaches its capacity.
        XCTAssertFalse(queue.insertFront(capacity))
        
        for i in 0..<capacity {
            XCTAssertEqual(queue.deleteRear(), i)
        }
        
        XCTAssertTrue(queue.isEmpty())

    }
    
    func test_insert_rear_delete_front() {
        let capacity = 10
        var queue = Dequeue<Int>(capacity: capacity)
        
        for i in 0..<capacity {
            XCTAssertTrue(queue.insertRear(i))
        }
        
        XCTAssertTrue(queue.isFull())
        
        // Verify new elements can't be inserted once the queue reaches its capacity.
        XCTAssertFalse(queue.insertRear(capacity))
        
        for i in 0..<capacity {
            XCTAssertEqual(queue.deleteFront(), i)
        }
        
        XCTAssertTrue(queue.isEmpty())
        XCTAssertNil(queue.deleteFront())
    }
    
    func test_insert_rear_delete_rear() {
        let capacity = 10
        var queue = Dequeue<Int>(capacity: capacity)
        
        for i in 0..<capacity {
            XCTAssertTrue(queue.insertRear(i))
        }
        
        XCTAssertTrue(queue.isFull())
        
        // Verify new elements can't be inserted once the queue reaches its capacity.
        XCTAssertFalse(queue.insertRear(capacity))
        
        for i in 0..<capacity {
            XCTAssertEqual(queue.deleteRear(), capacity - 1 - i)
        }
        
        XCTAssertTrue(queue.isEmpty())
    }
    
    func test_mixed_insert_delete_operations() {
        let capacity = 10
        var queue = Dequeue<Int>(capacity: capacity)
        
        XCTAssertTrue(queue.insertFront(1))
        XCTAssertTrue(queue.insertFront(2))
        XCTAssertTrue(queue.insertFront(3))
        
        XCTAssertEqual(queue.deleteRear(), 1)
        XCTAssertEqual(queue.deleteFront(), 3)
        
        XCTAssertTrue(queue.insertRear(4))
        XCTAssertTrue(queue.insertRear(5))
        XCTAssertTrue(queue.insertRear(6))
        
        XCTAssertEqual(queue.deleteFront(), 2)
        XCTAssertEqual(queue.deleteRear(), 6)
        XCTAssertEqual(queue.front(), 4)
        XCTAssertEqual(queue.rear(), 5)
    }
}
