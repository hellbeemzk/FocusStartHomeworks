//
//  FirstRouter.swift
//  CarCatalog
//
//  Created by Konstantin on 16.12.2021.
//

import UIKit

protocol IFirstRouter {
    func setRootController(controller: UIViewController)
    func setTargerController(controller: ISecondScreenVC)
    func next(with index: Int)
}

final class FirstRouter {
    private var controller: UIViewController?
    private var targetController: ISecondScreenVC?
}

extension FirstRouter: IFirstRouter {
    
    func setRootController(controller: UIViewController) {
        self.controller = controller
    }

    func setTargerController(controller: ISecondScreenVC) {
        self.targetController = controller
    }

    func next(with index: Int) {
        guard let targetController = self.targetController else {
            return
        }
        self.targetController?.setSelectedManufacturer(index: index)
        self.controller?.navigationController?.pushViewController(targetController, animated: true)
    }
}
