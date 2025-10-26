//
//  CacheInterface.swift
//  SwiftDSA
//
//  Created by Mithlesh Kumar Jha on 26/10/25.
//

/*
 CacheInterface: - A generic protocol that abstracts functionalities of a cache.
 */

protocol CacheInterface {
    associatedtype Key: Hashable
    associatedtype Value
    
    func get(_ key: Key) -> Value?
    func put(key: Key, value: Value)
    func remove(key: Key)
    func clear()
}
