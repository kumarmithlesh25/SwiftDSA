//
//  LRUCacheTests.swift
//  SwiftDSA
//
//  Created by Mithlesh Kumar Jha on 26/10/25.
//

import XCTest
@testable import SwiftDSA

final class LRUCacheTests: XCTestCase {
    
    func test_get_without_set() {
        let cache = LRUCache<Int, Data>(capacity: 10)
        let key = 1
        cache.put(key: 1, value: key.toData())
        
        XCTAssertNil(cache.get(2))
    }
    
    func test_set_get_within_capacity() {
        let capacity = 100
        let cache = LRUCache<Int, Data>(capacity: capacity)
        
        for i in 1...capacity {
            cache.put(key: i, value: i.toData())
        }
        
        // Get 10 random keys from known keys
        let randomKeys: [Int] = (1...10).map {
            Int.random(in: $0...capacity)
        }
        
        for key in randomKeys {
            guard let data = cache.get(key) else {
                XCTFail("Failed to retrieve value for key \(key) from cache")
                return
            }
            
            XCTAssertEqual(data.convert(), key)
        }
    }
    
    func test_old_element_replaced() {
        let capacity = 5
        let cache = LRUCache<Int, Data>(capacity: capacity)
        
        for i in 1...capacity {
            cache.put(key: i, value: i.toData())
        }
        
        let newKey = capacity + 1
        cache.put(key: newKey, value: newKey.toData())
        
        /// Verify cache removes the oldest item if new items are pushed when it is full
        XCTAssertNil(cache.get(1))
        
        guard let data = cache.get(newKey) else {
            XCTFail()
            return
        }
        XCTAssertEqual(data.convert(), newKey)
    }
    
    /*
     Verify calling put with existing key updates its lifetime in cache
     */
    func test_put_existing_element() {
        let capacity = 5
        let cache = LRUCache<Int, Data>(capacity: capacity)
        
        for i in 1...capacity {
            cache.put(key: i, value: i.toData())
        }
        
        /// Put the oldest key (1) again to refresh its lifespan in the cache
        cache.put(key: 1, value: 1.toData())
        
        /// Now put a new element to the cache
        let newKey = capacity + 1
        cache.put(key: newKey, value: newKey.toData())
        
        /// Verify cache removes the oldest key which is now 2 as the lifetime of oldest key as refreshed.
        XCTAssertNotNil(cache.get(1))
        XCTAssertNil(cache.get(2))
        
        /// Insert a few more keys to remove 3, 4, and 5 from cache
        cache.put(key: 100, value: 100.toData())
        cache.put(key: 101, value: 102.toData())
        cache.put(key: 102, value: 102.toData())
        
        /// The keys 3, 4, 5 shouldn't be in the cache now
        XCTAssertNil(cache.get(3))
        XCTAssertNil(cache.get(4))
        XCTAssertNil(cache.get(5))
        
        XCTAssertNotNil(cache.get(1))
        XCTAssertNotNil(cache.get(6))
        XCTAssertNotNil(cache.get(100))
        XCTAssertNotNil(cache.get(101))
        XCTAssertNotNil(cache.get(102))
    }

}
