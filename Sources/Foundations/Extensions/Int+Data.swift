//
//  Int.swift
//  SwiftDSA
//
//  Created by Mithlesh Kumar Jha on 26/10/25.
//

import Foundation

extension Int {
    func toData() -> Data {
        var data = Data()
        var num = self
        withUnsafeBytes(of: &num) {
            data.append(contentsOf: $0)
        }
        
        return data
    }
}


extension Data {
    func convert<T>() -> T {
        return self.withUnsafeBytes {
            $0.load(as: T.self)
        }
    }
}
