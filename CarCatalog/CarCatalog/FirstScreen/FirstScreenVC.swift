//
//  FirstScreenVC.swift
//  CarCatalog
//
//  Created by Konstantin on 13.12.2021.
//

import UIKit

final class FirstScreenVC: UIViewController {
    
    private enum Metrics {
        static let greenColor = UIColor.init(red: 75/255, green: 148/255, blue: 96/255, alpha: 1)
    }
    
    private let firstScreenView: IFirstScreenView
    private let firstScreenPresenter: FirstScreenPresenter
    
    struct Dependencies {
        let presenter: FirstScreenPresenter
    }
    
    init(dependencies: Dependencies) {
        self.firstScreenView = FirstScreenView(frame: UIScreen.main.bounds)
        self.firstScreenPresenter = dependencies.presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.firstScreenPresenter.loadView(controller: self, view: self.firstScreenView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureBackButton()
        self.view.addSubview(firstScreenView)
    }
    
    private func configureBackButton() {
        self.navigationController?.navigationBar.tintColor = Metrics.greenColor
    }
}
