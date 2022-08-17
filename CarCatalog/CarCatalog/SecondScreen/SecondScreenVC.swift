//
//  SecondScreenVC.swift
//  CarCatalog
//
//  Created by Konstantin on 13.12.2021.
//

import UIKit

protocol ISecondScreenVC: UIViewController {
    func setSelectedManufacturer(index: Int)
}

final class SecondScreenVC: UIViewController {
    
    private let secondScreenView: SecondScreenView
    private let secondScreenPresenter: SecondScreenPresenter
    
    struct Dependencies {
        let presenter: SecondScreenPresenter
    }
    
    init(dependencies: Dependencies) {
        self.secondScreenView = SecondScreenView(frame: UIScreen.main.bounds)
        self.secondScreenPresenter = dependencies.presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.secondScreenPresenter.loadView(controller: self, view: self.secondScreenView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(secondScreenView)
    }
}

extension SecondScreenVC: ISecondScreenVC {
    
    func setSelectedManufacturer(index: Int) {
        self.secondScreenPresenter.setSelectedManufacturer(index: index)
    }
}
