//
//  Cars.swift
//  CarCatalog
//
//  Created by Konstantin on 13.12.2021.
//

import Foundation

struct Cars {
    
    static let cars: [Car] = [Car(manufacturer: .bmw, body: .sedan, price: 46000, image: "bmwsed"),
                        Car(manufacturer: .bmw, body: .coupe, price: 51000, image: "bmwcoup"),
                        Car(manufacturer: .bmw, body: .hatchback, price: 43500, image: "bmwhat"),
                        Car(manufacturer: .bmw, body: .crossover, price: 49000, image: "bmwcros"),
                        Car(manufacturer: .mercedes, body: .sedan, price: 56000, image: "mercedessed"),
                        Car(manufacturer: .mercedes, body: .coupe, price: 61000, image: "mercedescoup"),
                        Car(manufacturer: .mercedes, body: .hatchback, price: 53500, image: "mercedeshat"),
                        Car(manufacturer: .mercedes, body: .crossover, price: 59000, image: "mercedescros"),
                        Car(manufacturer: .toyota, body: .sedan, price: 32000, image: "toyotased"),
                        Car(manufacturer: .toyota, body: .coupe, price: 39000, image: "toyotacoup"),
                        Car(manufacturer: .toyota, body: .hatchback, price: 37500, image: "toyotahat"),
                        Car(manufacturer: .toyota, body: .crossover, price: 41800, image: "toyotacros"),
                        Car(manufacturer: .nissan, body: .sedan, price: 28900, image: "nissansed"),
                        Car(manufacturer: .nissan, body: .coupe, price: 34300, image: "nissancoup"),
                        Car(manufacturer: .nissan, body: .hatchback, price: 31250, image: "nissanhat"),
                        Car(manufacturer: .nissan, body: .crossover, price: 37000, image: "nissancros"),
                        Car(manufacturer: .ford, body: .sedan, price: 23800, image: "fordsed"),
                        Car(manufacturer: .ford, body: .coupe, price: 27500, image: "fordcoup"),
                        Car(manufacturer: .ford, body: .hatchback, price: 24700, image: "fordhat"),
                        Car(manufacturer: .ford, body: .crossover, price: 29100, image: "fordcros")]

}
