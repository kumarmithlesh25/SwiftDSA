import Testing
@testable import SwiftDSA

@Test func testInsertHead() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let list = DoublyLinkedList<Int>()
    
    #expect(list.forwardList().isEmpty)
    #expect(list.backwardList().isEmpty)
    
    let first = LinkedListNode(value: 1)
    list.insertAtHead(first)
    
    #expect(list.forwardList().count == 1)
    #expect(list.backwardList().count == 1)
    
    #expect(list.forwardList() == [first])
    #expect(list.backwardList() == [first])
    
    let second = LinkedListNode(value: 2)
    list.insertAtHead(second)
    
    #expect(list.forwardList() == [second, first])
    #expect(list.backwardList() == [first, second])

    print("First List = \(list.forwardList())")
    print("Second List = \(list.backwardList())")
}


@Test func testAddTail() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let list = DoublyLinkedList<Int>()
    
    let first = LinkedListNode(value: 1)
    list.insertAtHead(first)
    
    #expect(list.forwardList().count == 1)
    #expect(list.backwardList().count == 1)
    
    #expect(list.forwardList() == [first])
    #expect(list.backwardList() == [first])
    
    let second = LinkedListNode(value: 2)
    list.addToTail(second)
    
    #expect(list.forwardList() == [first, second])
    #expect(list.backwardList() == [second, first])

    print("First List = \(list.forwardList())")
    print("Second List = \(list.backwardList())")
}

@Test func testRemoveNodes() async throws {
    let list = DoublyLinkedList<Int>()
    list.removeTail()
    
    #expect(list.forwardList() == [])
    #expect(list.backwardList() == [])
    #expect(list.tail == nil)
    
    let first = LinkedListNode(value: 1)
    list.insertAtHead(first)
    #expect(list.forwardList() == [first])
    #expect(list.backwardList() == [first])
    
    list.removeTail()
    #expect(list.forwardList() == [])
    #expect(list.backwardList() == [])
    #expect(list.tail == nil)
    
    list.insertAtHead(first)
    let second = LinkedListNode(value: 2)
    list.addToTail(second)
    
    list.removeTail()
    #expect(list.forwardList() == [first])
    #expect(list.backwardList() == [first])
    
    list.addToTail(second)
    
    #expect(list.forwardList() == [first, second])
    #expect(list.backwardList() == [second, first])

    list.removeNode(second)
    #expect(list.forwardList() == [first])
    #expect(list.backwardList() == [first])

    print("First List = \(list.forwardList())")
    print("Second List = \(list.backwardList())")
    
    list.removeAll()
    #expect(list.forwardList() == [])
    #expect(list.backwardList() == [])
    #expect(list.tail == nil)

    var expectedResult = [LinkedListNode<Int>]()
    for i in 1...100 {
        let node = LinkedListNode(value: i)
        expectedResult.append(node)
        list.addToTail(node)
    }
    
    #expect(list.forwardList() == expectedResult)
    #expect(list.backwardList() == expectedResult.reversed())
    print("First List = \(list.forwardList())")
    print("Second List = \(list.backwardList())")
    
    let nodeToDelete = expectedResult[2]
    list.removeNode(nodeToDelete)

    expectedResult.remove(at: 2)
    #expect(list.forwardList() == expectedResult)
    #expect(list.backwardList() == expectedResult.reversed())
    print("First List = \(list.forwardList())")
    print("Second List = \(list.backwardList())")
    
    list.removeAll()
    #expect(list.forwardList() == [])
    #expect(list.backwardList() == [])
    #expect(list.tail == nil)
}

@Test func testMoveToHead() {
    let list = DoublyLinkedList<Int>()
    let first = LinkedListNode(value: 1)
    
    list.moveToHead(first)
    #expect(list.forwardList() == [first])
    
    let second = LinkedListNode(value: 2)
    list.insertAtHead(second)
    
    #expect(list.forwardList() == [second, first])
    #expect(list.backwardList() == [first, second])
    
    let third = LinkedListNode(value: 3)
    list.addToTail(third)
    #expect(list.forwardList() == [second, first, third])
    #expect(list.backwardList() == [third, first, second])
    
    list.moveToHead(third)
    #expect(list.forwardList() == [third, second, first])
    #expect(list.backwardList() == [first, second, third])
    
    list.moveToHead(second)
    #expect(list.forwardList() == [second, third, first])
    #expect(list.backwardList() == [first, third, second])
    
    list.moveToHead(second)
    #expect(list.forwardList() == [second, third, first])
    #expect(list.backwardList() == [first, third, second])

}
