//
//  Benchmark.swift
//  SwiftDSA
//
//  Created by Mithlesh Kumar Jha on 28/10/25.
//

import Foundation
import MachO

final class Benchmark {

    // MARK: - Memory Usage Helper
    class func currentMemoryUsageMB() -> Double {
        var info = task_vm_info_data_t()
        var count = mach_msg_type_number_t(MemoryLayout<task_vm_info_data_t>.stride) / 4
        let result = withUnsafeMutablePointer(to: &info) {
            $0.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
                task_info(mach_task_self_, task_flavor_t(TASK_VM_INFO), $0, &count)
            }
        }
        guard result == KERN_SUCCESS else { return -1 }
        return Double(info.phys_footprint) / (1024.0 * 1024.0)
    }

    // MARK: - Benchmarking Harness
    class func benchmark(name: String, runs: Int = 10, block: () -> Void) {
        var times: [Double] = []
        
        for _ in 0..<runs {
            let startMemory = currentMemoryUsageMB()
            let start = DispatchTime.now()
            
            block()
            
            let end = DispatchTime.now()
            let endMemory = currentMemoryUsageMB()
            
            let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
            let timeInMs = Double(nanoTime) / 1_000_000
            
            times.append(timeInMs)
            print(String(format: "Run: %.3f ms | Memory Δ: %.2f MB",
                         timeInMs, endMemory - startMemory))
        }
        
        if let min = times.min(), let max = times.max() {
            let avg = times.reduce(0, +) / Double(times.count)
            print("\n⏱ Benchmark: \(name)")
            print(String(format: "Min: %.3f ms | Avg: %.3f ms | Max: %.3f ms",
                         min, avg, max))
        }
    }
}
