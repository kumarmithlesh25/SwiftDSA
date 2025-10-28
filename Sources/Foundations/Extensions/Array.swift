//
//  Array.swift
//  SwiftDSA
//
//  Created by Mithlesh Kumar Jha on 27/10/25.
//

import Foundation

extension Array {
    func index(of element: Element) -> Int? where Element: Equatable {
        for (index,value) in self.enumerated() {
            if value == element {
                return index
            }
        }
        return nil
    }
}


