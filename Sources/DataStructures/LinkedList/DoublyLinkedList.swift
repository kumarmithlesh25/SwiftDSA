//
//  DoublyLinkedList.swift
//  LinkedList
//
//  Created by Mithlesh Kumar Jha on 29/09/25.
//


public final class DoublyLinkedList<T> {
    public typealias Node = LinkedListNode<T>
    
    private var head: Node?
    public private(set) weak var tail: Node?
    
    public init() {
        self.head = nil
        self.tail = nil
    }
    
    // Adds a Node before head
    public func insertAtHead(_ node: Node) {
        node.next = head
        node.previous = nil
        head?.previous = node
        head = node
        
        if tail == nil {
            tail = node
        }
    }
    
    // Adds a node after tail
    public func addToTail(_ node: Node) {
        node.next = nil
        node.previous = tail
        tail?.next = node
        tail = node
        
        if head == nil {
            head = node
        }
    }
    
    public func moveToHead(_ node: Node) {
        guard head !== nil else {
            insertAtHead(node)
            return
        }
        
        guard node !== head else { return }
        
        node.previous?.next = node.next
        node.next?.previous = node.previous
        
        if node === tail {
            tail = node.previous
        }
        
        node.next = head
        node.previous = nil
        head?.previous = node
        head = node
    }
    
    // Removes a node after head
    public func removeNode(_ node: Node) {
        if node === head { head = node.next }
        if node === tail { tail = node.previous }
        
        node.previous?.next = node.next
        node.next?.previous = node.previous
    }
    
    public func removeTail() -> Node? {
        guard let tail = tail else { return nil }
        guard head !== tail else {
            removeAll()
            return tail
        }
        
        self.tail?.previous?.next = nil
        self.tail = self.tail?.previous
        return tail
    }
    
    // Removes tail
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    #if DEBUG
    func forwardList() -> [Node] {
        var next = head
        var result = [Node]()
        
        while next != nil {
            result.append(next!)
            next = next?.next
        }
        
        return result
    }
    
    func backwardList() -> [Node] {
        var prev = tail
        var result = [Node]()
        
        while prev != nil {
            result.append(prev!)
            prev = prev?.previous
        }
        
        return result
    }
    
    #endif
}
