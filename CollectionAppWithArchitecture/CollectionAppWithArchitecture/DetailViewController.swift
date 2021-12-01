//
//  DetailViewController.swift
//  CollectionApp
//
//  Created by Konstantin on 29.11.2021.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private let detailView: DetailView
    let detailPresenter: DetailPresenter
    
    var indexBook: Int?
    
    init() {
        self.detailView = DetailView(frame: UIScreen.main.bounds)
        self.detailPresenter = DetailPresenter()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        self.detailPresenter.loadView(controller: self, view: self.detailView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(detailView)
    }
}

extension DetailViewController {
        
//    func presentModalScreen() {
//        let modalVC = ModalViewController()
//        modalVC.viewModel.indexBook = indexBook
//        self.present(modalVC, animated: true, completion: nil)
//    }
}
    
    

    
    
