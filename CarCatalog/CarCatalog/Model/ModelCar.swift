//
//  ModelCar.swift
//  CarCatalog
//
//  Created by Konstantin on 13.12.2021.
//

import Foundation

protocol IModelCar {
    func getSelectedCar(from indexManufacturer: Int, and indexBodyType: Int) -> Car?
    func getBodyTypes() -> [Body]
    func getManufacturer() -> [Manufacturer]
}

final class ModelCar { }

extension ModelCar: IModelCar {
    func getSelectedCar(from indexManufacturer: Int, and indexBodyType: Int) -> Car? {
        let manufacturer = self.getManufacturer()[indexManufacturer]
        let body = self.getBodyTypes()[indexBodyType]
    
        return Cars.cars.last { $0.manufacturer == manufacturer && $0.body == body } // filter?
    }
    
    func getBodyTypes() -> [Body] {
        return Body.allCases
    }
    
    func getManufacturer() -> [Manufacturer] {
        return Manufacturer.allCases
    }
}
