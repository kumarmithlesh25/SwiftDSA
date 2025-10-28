//
//  RandomInputGenerator.swift
//  SwiftDSA
//
//  Created by Mithlesh Kumar Jha on 28/10/25.
//

import Foundation

// MARK: - Random Input Generators

final class RandomDataGenerator {
    public class func randomIntArray(size: Int, range: ClosedRange<Int> = 0...1_000_000) -> [Int] {
        return (0..<size).map { _ in Int.random(in: range) }
    }
    
    // Random String Array
    public class func randomStringArray(size: Int, length: Int) -> [String] {
        let letters = "abcdefghijklmnopqrstuvwxyz"
        return (0..<size).map { _ in
            String((0..<length).map { _ in letters.randomElement()! })
        }
    }
    
    // Random Graph (Adjacency List, undirected by default)
    public class func randomGraph(nodes: Int, edges: Int, directed: Bool = false) -> [[Int]] {
        var graph = Array(repeating: [Int](), count: nodes)
        for _ in 0..<edges {
            let u = Int.random(in: 0..<nodes)
            let v = Int.random(in: 0..<nodes)
            if u != v {
                graph[u].append(v)
                if !directed {
                    graph[v].append(u)
                }
            }
        }
        return graph
    }
}
