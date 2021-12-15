//
//  SecondScreenPresenter.swift
//  CarCatalog
//
//  Created by Konstantin on 16.12.2021.
//

import Foundation

protocol ISecondScreenPresenter {
    func loadView(controller: ISecondScreenVC, view: ISecondScreenView)
    func setSelectedManufacturer(index: Int)
}

final class SecondScreenPresenter {
    
    private let model: IModelCar
    private weak var controller: ISecondScreenVC?
    private weak var view: ISecondScreenView?
    
    private var indexManufacturer: Int?
    private var indexBody: Int?
    
    struct Dependencies {
        let model: IModelCar
    }
    
    init(dependencies: Dependencies) {
        self.model = dependencies.model
    }
}

private extension SecondScreenPresenter {
    
    func configureView() {
        self.setPriceCar()
        self.setDefaultImageCar()
    }
    
    func setHandlers() {
        
        self.view?.calculatePriceHandler = { [weak self] in
            self?.setPriceCar()
        }
        
        self.view?.getNumberOfRowsHandler = { [weak self] in
            self?.getNumbersOfBodyTypes() ?? 0
        }
        
        self.view?.onTouchedHandler = { [weak self] index in
            self?.onTouched(index: index) ?? ""
        }
        
        self.view?.getContentForCellHandler = { [weak self] index in
            self?.getNameOfBodyType(index: index) ?? ""
        }
    }
    
    func setPriceCar() {
        if let price = self.model.getSelectedCar(from: self.indexManufacturer ?? 1, and: self.indexBody ?? 0)?.price {
            let cost = String(price) + "$"
            self.view?.setPriceCar(price: cost)
        }
    }
    
    func setDefaultImageCar() {
        if let image = self.model.getSelectedCar(from: self.indexManufacturer ?? 1, and: .zero)?.image {
            self.view?.setDefaultImageCar(with: image)
        }
    }
    
    func getNumbersOfBodyTypes() -> Int {
        return self.model.getBodyTypes().count
    }
    
    func onTouched(index: Int) -> String {
        self.indexBody = index
        return self.model.getSelectedCar(from: self.indexManufacturer ?? 1, and: index)?.image ?? ""
    }
    
    func getNameOfBodyType(index: Int) -> String {
        return self.model.getBodyTypes()[index].rawValue
    }
}

extension SecondScreenPresenter: ISecondScreenPresenter {
    
    func loadView(controller: ISecondScreenVC, view: ISecondScreenView) {
        self.controller = controller
        self.view = view
        self.configureView()
        self.setHandlers()
    }
    
    func setSelectedManufacturer(index: Int) {
        self.indexManufacturer = index
        self.configureView()
    }
}
