//
//  SecondScreenAssembly.swift
//  CarCatalog
//
//  Created by Konstantin on 13.12.2021.
//

import Foundation
import UIKit

final class SecondScreenAssembly {
    
    static func build() -> UIViewController {
        let model = ModelCar()
  
        let presenter = SecondScreenPresenter(
            dependencies: .init(model: model)
        )
        let controller = SecondScreenVC(
            dependencies: .init(presenter: presenter)
        )
        return controller
    }
}
