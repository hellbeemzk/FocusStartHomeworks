//
//  Books.swift
//  CollectionApp
//
//  Created by Konstantin on 21.11.2021.
//

import UIKit

struct Book {
    let image: String
    let name: String
    let author: String
    let genre: String
    let rating: String
}

extension Book {
    static var books: [Book] {
        let book1 = Book(image: "1", name: "451 градус по Фаренгейту", author: "Рэй Брэдбери", genre: "Роман", rating: "5")
        let book2 = Book(image: "1", name: "1984", author: "Джордж Оруэлл", genre: "Научная фантастика", rating: "5")
        let book3 = Book(image: "1", name: "Мастер и Маргарита", author: "Михаил Булгаков", genre: "Роман", rating: "5")
        let book4 = Book(image: "1", name: "Шантарам", author: "Грегори Дэвид Робертс", genre: "Роман", rating: "5")
        let book5 = Book(image: "1", name: "Три товарища", author: "Эрих Мария Ремарк", genre: "Военная проза", rating: "5")
        let book6 = Book(image: "1", name: "Цветы для Элджернона", author: "Дэниел Киз", genre: "Роман", rating: "5")
        let book7 = Book(image: "1", name: "Портрет дориана грея", author: "Оскар Уайльд", genre: "Готическая литература", rating: "5")
        let book8 = Book(image: "1", name: "Маленький принц", author: "Антуан де Сент-Экзюпери", genre: "Художественный вымысел", rating: "5")
        let book9 = Book(image: "1", name: "Над пропостью во ржи", author: "Джером Дэвид Сэлинджер", genre: "Роман", rating: "5")
        let book10 = Book(image: "1", name: "Вино из одуванчиков", author: "Рэй Брэдбери", genre: "Роман", rating: "5")
        
        return [book1,book2,book3,book4,book5,book6,book7,book8,book9,book10]
    }
    
    
    
}
