//
//  main.swift
//  homework1
//
//  Created by Konstantin Matvienko on 01.11.2021.
//

import Foundation

var cars = [Car]()

startMenu()

func startMenu() {
    print("""
        
        1 - Добавить автомобиль в список
        2 - Вывести список всех добавленных автомобилей
        3 - Вывести список отфильтрованых по кузову автомобилей
        4 - Выход
        """)
    
    let menuIndex = strongReadLine("Введите номер пункта меню")
    switch menuIndex {
    case "1":
        print("Добавить автомобиль в список")
        carAdd()
    case "2":
        print("Список всех добавленных автомобилей")
        printAllCars(cars: cars)
    case "3":
        printFilteredCars()
    case "4":
        print("Выход")
        break
    default:
        print("Ввод некорректен, введите номер пункта меню")
        startMenu()
    }
}

func strongReadLine(_ text: String) -> String {
    print(text)
    while true {
        if let inputText = readLine(), inputText.isEmpty == false {
            return inputText
        }
        print("Некорректный ввод, повторите")
    }
}


func carAdd() {
    let manufacturer = strongReadLine("Введите производителя:")
    let model = strongReadLine("Введите модель автомобиля:")
    
    Car.Body.printBodyTypes()
    let body = Car.Body.getBodyType()
    
    print("Введите год выпуска автомобиля (необязательно) :")
    let yearOfIssue = Int(readLine() ?? "-")
    
    print("Введите номер автомобиля (необязательно) :")
    let carNumber = readLine()
    
    let addedCar = Car(manufacturer: manufacturer,
                       model: model,
                       body: body,
                       yearOfIssue: yearOfIssue,
                       carNumber: carNumber)
    cars.append(addedCar)
    
    startMenu()
}

func printAllCars(cars: [Car]) {
    if cars.isEmpty {
        print("Список автомобилей пуст")
    }
    
    for car in cars {
        print("\n Производитель: ",car.manufacturer,
              "\n Модель: ", car.model,
              "\n Тип кузова: ", car.body.rawValue,
              "\n Год выпуска: ", car.yearOfIssue ?? "-") // Далее гос. номер по условию задачи не должен отображаться
    }
    startMenu()
}

func printFilteredCars() {
    Car.Body.printBodyTypes()
    let body = Car.Body.getBodyType()
    let filteredCars = cars.filter { $0.body == body }
    print("Представлен список автомобилей по кузову - \(body.rawValue)")
    printAllCars(cars: filteredCars)
}


