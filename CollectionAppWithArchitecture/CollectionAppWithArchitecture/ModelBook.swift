//
//  ModelBook.swift
//  CollectionApp
//
//  Created by Konstantin on 29.11.2021.
//

import UIKit

struct ModelBook {
    let image: String
    let name: String
    let author: String
    let genre: String
    let rating: String
}

extension ModelBook {
    static var arrayBooks: [ModelBook] {
        let book1 = ModelBook(image: "451", name: "451 градус по Фаренгейту", author: "Рэй Брэдбери", genre: "Роман", rating: "4.3")
        let book2 = ModelBook(image: "1984", name: "1984", author: "Джордж Оруэлл", genre: "Научная фантастика", rating: "4.5")
        let book3 = ModelBook(image: "master", name: "Мастер и Маргарита", author: "Михаил Булгаков", genre: "Роман", rating: "4.5")
        let book4 = ModelBook(image: "shantaram", name: "Шантарам", author: "Грегори Дэвид Робертс", genre: "Роман", rating: "4.4")
        let book5 = ModelBook(image: "tovarish", name: "Три товарища", author: "Эрих Мария Ремарк", genre: "Военная проза", rating: "4.6")
        let book6 = ModelBook(image: "cveti", name: "Цветы для Элджернона", author: "Дэниел Киз", genre: "Роман", rating: "4.6")
        let book7 = ModelBook(image: "portret", name: "Портрет Дориана Грея", author: "Оскар Уайльд", genre: "Готическая литература", rating: "4.3")
        let book8 = ModelBook(image: "prince", name: "Маленький принц", author: "Антуан де Сент-Экзюпери", genre: "Художественный вымысел", rating: "4.5")
        let book9 = ModelBook(image: "propast", name: "Над пропостью во ржи", author: "Джером Дэвид Сэлинджер", genre: "Роман", rating: "3.8")
        let book10 = ModelBook(image: "vino", name: "Вино из одуванчиков", author: "Рэй Брэдбери", genre: "Роман", rating: "4.2")
        
        return [book1,book2,book3,book4,book5,book6,book7,book8,book9,book10]
    }
    
    static func getBook(from index: Int) -> ModelBook {
        arrayBooks[index]
    }
}
