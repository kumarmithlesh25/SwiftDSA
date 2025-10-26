//
//  LRUCache.swift
//  LinkedList
//
//  Created by Mithlesh Kumar Jha on 30/09/25.
//


public class LRUNode<Key: Hashable, Value> {
    internal init(key: Key, value: Value) {
        self.key = key
        self.value = value
    }
    
    let key: Key
    var value: Value
}

public final class LRUCache<K: Hashable, V> {
    internal init(
        capacity: Int
    ) {
        self.capacity = capacity
    }
    
    
    public typealias LRUPayload = LRUNode<K, V>
    
    var cache: [K: LinkedListNode<LRUPayload>] = [:]
    var list: LinkedList<LRUPayload> = .init()
    var size: Int = 0
    let capacity: Int
    
    public func get(_ key: K) -> V? {
        guard let payload = cache[key] else { return nil }
        list.removeNode(payload)
        list.addToHead(payload)
        return payload.value.value
    }
    
    public func put(key: K, value: V) {
        if let payload = cache[key] {
            payload.value.value = value
            list.removeNode(payload)
            list.addToHead(payload)
        } else {
            let payload = LRUPayload(key: key, value: value)
            let node = LinkedListNode(value: payload)
            
            if size == capacity {
                if let tail = list.removeTail() {
                    cache.removeValue(forKey: tail.value.key)
                    size -= 1
                }
            }
            
            list.addToHead(node)
            cache[key] = node
            size += 1
        }
    }
}
