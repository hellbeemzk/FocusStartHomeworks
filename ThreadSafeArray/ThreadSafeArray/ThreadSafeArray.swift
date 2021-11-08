//
//  ThreadSafeArray.swift
//  ThreadSafeArray
//
//  Created by Konstantin Matvienko on 07.11.2021.
//

import Foundation

class ThreadSafeArray<Type: Equatable> {
    
    private var array = [Type]()
    private var concurrentQueue = DispatchQueue(label: "MyConcurrentQueue", attributes: .concurrent)
    
    var isEmpty: Bool {
        var resultOfEmpty = false
        concurrentQueue.sync {
            resultOfEmpty = array.isEmpty
        }
        return resultOfEmpty
    }
    
    var count: Int {
        var resultOfCount = 0
        concurrentQueue.sync {
            resultOfCount = array.count
        }
        return resultOfCount
    }
    
    func append(_ item: Type) {
        self.concurrentQueue.async(flags: .barrier) {
            self.array.append(item)
        }
    }
    
    func remove(at index: Int) {
        self.concurrentQueue.async(flags: .barrier) {
            if index < self.array.count, index >= 0 {
                self.array.remove(at: index)
            }
        }
    }
    
    subscript(index: Int) -> Type {
        self.concurrentQueue.sync {
            return self.array[index]
        }
    }
    
    func contains(_ element: Type) -> Bool {
        self.concurrentQueue.sync {
            return self.array.contains(element)
        }
    }
    
}
