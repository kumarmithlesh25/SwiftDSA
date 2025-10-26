//
//  LRUCache.swift
//  LinkedList
//
//  Created by Mithlesh Kumar Jha on 30/09/25.
//

import Foundation

/*
 LRUCache: - A concrete implementation of CacheInterface.
 Oldest key values are removed from the cache once it reaches its capacity.
 */

public final class LRUCache<Key: Hashable, Value>: CacheInterface {
    private class LRUNode {
        let key: Key
        var value: Value
        
        init(key: Key, value: Value) {
            self.key = key
            self.value = value
        }
    }
    
    internal init(
        capacity: Int
    ) {
        self.capacity = capacity
    }
    
    private var cache: [Key: LinkedListNode<LRUNode>] = [:]
    private var list: DoublyLinkedList<LRUNode> = .init()
    
    var size: Int = 0
    let capacity: Int
    
    /// Returns value for given key from the cache and nil if value is not found in the cache
    /// If cache contains this key, calling get updates its priority in the cache
    /// O(1)
    public func get(_ key: Key) -> Value? {
        guard let payload = cache[key] else { return nil }
        list.moveToHead(payload)
        return payload.value.value
    }
    
    /// Sets value for given key in the cache or add new key-value pair to the cache
    /// If cache contains this key, calling put updates its priority in the cache
    /// O(1)
    public func put(key: Key, value: Value) {
        if let payload = cache[key] {
            payload.value.value = value
            list.moveToHead(payload)
        } else {
            let payload = LRUNode(key: key, value: value)
            let node = LinkedListNode(value: payload)
            
            if size == capacity {
                if let tail = list.removeTail() {
                    cache.removeValue(forKey: tail.value.key)
                    size -= 1
                }
            }
            
            list.insertAtHead(node)
            cache[key] = node
            size += 1
        }
    }
    
    public func clear() {
        list.removeAll()
        cache.removeAll()
        size = 0
    }
    
    public func remove(key: Key) {
        /// Check if this key is found in the cache
        guard let node = cache[key] else { return }
        list.removeNode(node)
        cache.removeValue(forKey: key)
        size -= 1
    }
}
