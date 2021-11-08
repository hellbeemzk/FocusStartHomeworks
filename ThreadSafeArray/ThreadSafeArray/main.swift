//
//  main.swift
//  ThreadSafeArray
//
//  Created by Konstantin Matvienko on 07.11.2021.
//

import Foundation

var testArray = ThreadSafeArray<Int>()
var testDispatchGroup = DispatchGroup()
var testQueue = DispatchQueue(label: "MyTestQueue", attributes: .concurrent)

func appendItems() {
    for item in 0...1000 {
        testArray.append(item)
    }
}

//MARK: test properties and methods
print("Array is empty? \(testArray.isEmpty)")
print("Array has \(testArray.count) items BEFORE append items")

testDispatchGroup.enter()
testQueue.async {
    appendItems()
    testDispatchGroup.leave()
}

testDispatchGroup.enter()
testQueue.async {
    appendItems()
    testDispatchGroup.leave()
}

testDispatchGroup.wait()

print()
print("Array is empty? \(testArray.isEmpty)")
print("Array has \(testArray.count) items AFTER append items")




