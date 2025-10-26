//
//  DoublyLinkedList.swift
//  LinkedList
//
//  Created by Mithlesh Kumar Jha on 30/09/25.
//

public class LinkedListNode<V>: Equatable {
    public static func == (lhs: LinkedListNode<V>, rhs: LinkedListNode<V>) -> Bool {
        return lhs === rhs
    }
    
    public init(value: V) {
        self.value = value
    }
    
    public var value: V
    public var next: LinkedListNode?
    
    public weak var previous: LinkedListNode?
}

extension LinkedListNode: CustomStringConvertible {
    public var description: String {
       "Value = \(value)"
    }
}

public final class LinkedList<T> {
    
    typealias Node = LinkedListNode<T>
    
    private(set) var head: Node?
    private(set) var tail: Node?
    
    public init(node: LinkedListNode<T>? = nil) {
        self.head = node
        self.tail = node
        
        node?.next = nil
        node?.previous = nil
    }
    
    
    // Adds a node before head
    public func addToHead(_ node: LinkedListNode<T>) {
        node.next = head
        node.previous = nil
        head?.previous = node
        
        if tail == nil {
            tail = node
        }
        
        head = node
    }
    
    // Adds a node after tail
    public func addToTail(_ node: LinkedListNode<T>) {
        node.next = nil
        node.previous = tail
        tail?.next = node
        tail = node
        
        if head == nil {
            head = node
        }
    }
    
    public func removeNode(_ node: LinkedListNode<T>) {
        node.previous?.next = node.next
        node.next?.previous = node.previous
        
        if node === head { head = node.next }
        if node === tail { tail = node.previous }
        
        node.next = nil
        node.previous = nil
    }
    
    
    // Removes tail
    public func removeTail() -> LinkedListNode<T>? {
        guard let tail = tail else { return nil }
        removeNode(tail)
        return tail
    }
}
