//
//  FirstScreenPresenter.swift
//  CarCatalog
//
//  Created by Konstantin on 16.12.2021.
//

import Foundation

protocol IFirstScreenPresenter {
    func loadView(controller: FirstScreenVC, view: IFirstScreenView)
}

final class FirstScreenPresenter {
    
    private let model: IModelCar
    private let router: IFirstRouter
    private weak var controller: FirstScreenVC?
    private weak var view: IFirstScreenView?
    
    
    struct Dependencies {
        let model: IModelCar
        let router: FirstRouter
    }

    init(dependencies: Dependencies) {
        self.model = dependencies.model
        self.router = dependencies.router
    }
}
    
private extension FirstScreenPresenter {
    
    func setHandlers() {
        self.view?.getNumberOfRowsHandler = { [weak self] in
            self?.getNumberOfManufacturers() ?? 0
        }
        
        self.view?.onTouchedHandler = { [weak self] index in
            self?.onTouchedAction(index: index)
        }
        
        self.view?.getContentForCellHandler = { [weak self] index in
            self?.getNameOfManufacturer(index: index) ?? ""
        }
    }
    
    func getNumberOfManufacturers() -> Int {
        return self.model.getManufacturer().count
    }
    
    func onTouchedAction(index: Int) {
        self.router.next(with: index)
    }
    
    func getNameOfManufacturer(index: Int) -> String {
        return self.model.getManufacturer()[index].rawValue
    }
}

extension FirstScreenPresenter: IFirstScreenPresenter {
    
    func loadView(controller: FirstScreenVC, view: IFirstScreenView) {
        self.controller = controller
        self.view = view
        self.setHandlers()
    }
}
