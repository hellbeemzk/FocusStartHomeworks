//
//  ModalViewModel.swift
//  CollectionApp
//
//  Created by Konstantin on 29.12.2021.
//

import Foundation

final class Observable<T> {
    var data: T {
        didSet {
            self.notify?(self.data)
        }
    }
    
    private var notify: ((T) -> Void)?
    
    init(_ data: T) {
        self.data = data
    }
    
    func setNotify(notify: @escaping ((T) -> Void)) {
        self.notify = notify
        self.notify?(self.data)
    }
}

final class ViewModel {
    
    private var indexBook: Int?
    
    init(index: Int) {
        self.indexBook = index
        self.updateModel()
    }

    var data: Observable<String> = Observable<String>("Оценка выше всяких похвал, но если точнее... ")
    private var delayRandomTime = DispatchTimeInterval.seconds(Int.random(in: 1..<5))
    
    private func updateModel() {
        DispatchQueue.main.asyncAfter(deadline: .now() + delayRandomTime) { [weak self] in
            if let index = self?.indexBook {
                self?.data.data = "Оценка книги по рейтингу портала LiveLib - " + ModelBook.getBook(from: index).rating
            }
        }
    }
}
