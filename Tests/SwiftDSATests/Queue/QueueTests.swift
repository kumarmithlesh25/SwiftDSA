import XCTest
@testable import SwiftDSA

final class QueueTests: XCTestCase {
    func testEnqueueDequeue() throws {
        var queue = Queue<String>()
        
        XCTAssertTrue(queue.enqueue("first"))
        XCTAssertTrue(queue.enqueue("second"))
        XCTAssertTrue(queue.enqueue("third"))
        XCTAssertTrue(queue.enqueue("fourth"))
        
        XCTAssertEqual(queue.dequeue(), "first")
        XCTAssertEqual(queue.dequeue(), "second")
        XCTAssertEqual(queue.dequeue(), "third")
        XCTAssertEqual(queue.dequeue(), "fourth")
        XCTAssertNil(queue.dequeue())
    }
    
    func testPeek() throws {
        var queue = Queue<String>()
        
        XCTAssertTrue(queue.enqueue("first"))
        XCTAssertTrue(queue.enqueue("second"))
        XCTAssertTrue(queue.enqueue("third"))
        XCTAssertTrue(queue.enqueue("fourth"))
        
        XCTAssertEqual(queue.peek(), "first")
        XCTAssertEqual(queue.dequeue(), "first")
        XCTAssertEqual(queue.peek(), "second")
    }
    
    func testIsEmpty() throws {
        var queue = Queue<String>()
        
        XCTAssertTrue(queue.enqueue("first"))
        XCTAssertTrue(queue.enqueue("second"))

        _ = queue.peek()
        _ = queue.peek()
        XCTAssertFalse(queue.isEmpty())
        
        XCTAssertEqual(queue.dequeue(), "first")
        XCTAssertEqual(queue.dequeue(), "second")
        XCTAssertTrue(queue.isEmpty())
    }
    
    func testCount() throws {
        var queue = Queue<String>()
        
        _ = queue.enqueue("first")
        XCTAssertEqual(queue.count(), 1)
        
        _ = queue.peek()
        // Peek shouldn't remove element
        XCTAssertEqual(queue.count(), 1)
        
        _ = queue.dequeue()
        XCTAssertEqual(queue.count(), 0)
        
        _ = queue.enqueue("second")
        _ =  queue.enqueue("third")
        _ = queue.enqueue("fourth")
        XCTAssertEqual(queue.count(), 3)
        
        _ = queue.dequeue()
        XCTAssertEqual(queue.count(), 2)
    }
    
}
