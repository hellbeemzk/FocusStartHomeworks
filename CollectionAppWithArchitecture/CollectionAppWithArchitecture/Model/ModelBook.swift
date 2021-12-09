//
//  ModelBook.swift
//  CollectionAppWithArchitecture
//
//  Created by Konstantin on 08.12.2021.
//

import Foundation

final class ModelBook {
    
    static var arrayBooks: [Book] {
        let book1 = Book(image: "451", name: "451 градус по Фаренгейту", author: "Рэй Брэдбери", genre: "Роман", rating: "4.3")
        let book2 = Book(image: "1984", name: "1984", author: "Джордж Оруэлл", genre: "Научная фантастика", rating: "4.5")
        let book3 = Book(image: "master", name: "Мастер и Маргарита", author: "Михаил Булгаков", genre: "Роман", rating: "4.5")
        let book4 = Book(image: "shantaram", name: "Шантарам", author: "Грегори Дэвид Робертс", genre: "Роман", rating: "4.4")
        let book5 = Book(image: "tovarish", name: "Три товарища", author: "Эрих Мария Ремарк", genre: "Военная проза", rating: "4.6")
        let book6 = Book(image: "cveti", name: "Цветы для Элджернона", author: "Дэниел Киз", genre: "Роман", rating: "4.6")
        let book7 = Book(image: "portret", name: "Портрет Дориана Грея", author: "Оскар Уайльд", genre: "Готическая литература", rating: "4.3")
        let book8 = Book(image: "prince", name: "Маленький принц", author: "Антуан де Сент-Экзюпери", genre: "Художественный вымысел", rating: "4.5")
        let book9 = Book(image: "propast", name: "Над пропостью во ржи", author: "Джером Дэвид Сэлинджер", genre: "Роман", rating: "3.8")
        let book10 = Book(image: "vino", name: "Вино из одуванчиков", author: "Рэй Брэдбери", genre: "Роман", rating: "4.2")
        
        return [book1,book2,book3,book4,book5,book6,book7,book8,book9,book10]
    }
    
    static func getBook(from index: Int) -> Book {
        arrayBooks[index]
    }
}
