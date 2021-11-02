//
//  Car.swift
//  homework1
//
//  Created by Konstantin Matvienko on 01.11.2021.
//

import Foundation

struct Car {
    
    let manufacturer: String
    let model: String
    let body: Body
    let yearOfIssue: Int?
    let carNumber: String?
    
    
    enum Body: String, CaseIterable {
        
        case sedan = "Седан"
        case coupe = "Купe"
        case hatchback = "Хэтчбэк"
        case unkown = "Неопределенный"
        
        static func printBodyTypes() {
            print("Введите тип кузова автомобиля")
            for (num,body) in Body.allCases.enumerated() {
                print("\(num) - \(body.rawValue)")
            }
        }
        
        static func getBodyType() -> Car.Body {
            let bodyIndex = strongReadLine("")
            switch bodyIndex {
            case "0":
                return .sedan
            case "1":
                return .coupe
            case "2":
                return .hatchback
            default:
                print("Выбран неопределенный тип кузова")
                return .unkown
            }
        }
    }
}
