//
//  ThreadSafeArray.swift
//  ThreadSafeArray
//
//  Created by Konstantin Matvienko on 07.11.2021.
//

import Foundation

class ThreadSafeArray<Type: Equatable> {
    
    private var safeArray = [Type]()
    private var concurrentQueue = DispatchQueue(label: "MyConcurrentQueue", attributes: .concurrent)
    
    var isEmpty: Bool {
        var resultOfEmpty = false
        concurrentQueue.sync {
            resultOfEmpty = safeArray.isEmpty
        }
        return resultOfEmpty
    }
    
    var count: Int {
        get {
            var resultOfCount = 0
            concurrentQueue.sync {
                resultOfCount = safeArray.count
            }
            return resultOfCount
        }
    }
    
    func append(_ item: Type) {
        self.concurrentQueue.async(flags: .barrier) {
            self.safeArray.append(item)
        }
    }
    
    func remove(at index: Int) {
        self.concurrentQueue.async(flags: .barrier) {
            if index < self.safeArray.count, index >= 0 {
            self.safeArray.remove(at: index)
            }
        }
    }
    
    subscript(index: Int) -> Type? {
        var item: Type?
        self.concurrentQueue.sync {
            if index < self.safeArray.count, index >= 0 {
                item = self.safeArray[index]
            }
        }
        return item
    }
    
    func contains(_ element: Type) -> Bool {
        self.concurrentQueue.sync {
            return self.safeArray.contains(element)
        }
    }
    
}
