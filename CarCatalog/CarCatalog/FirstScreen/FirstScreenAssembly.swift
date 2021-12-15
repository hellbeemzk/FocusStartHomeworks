//
//  FirstScreenAssembly.swift
//  CarCatalog
//
//  Created by Konstantin on 13.12.2021.
//

import Foundation
import UIKit

final class FirstScreenAssembly {
    static func build() -> UIViewController {
        let model = ModelCar()
        let router = FirstRouter()
        
        let presenter = FirstScreenPresenter(
            dependencies: .init(model: model, router: router)
        )
        let controller = FirstScreenVC(
            dependencies: .init(presenter: presenter)
        )
        let targetController = SecondScreenAssembly.build()
        
        router.setRootController(controller: controller)
        router.setTargerController(controller: targetController as! ISecondScreenVC)
        
        return controller
    }
}
