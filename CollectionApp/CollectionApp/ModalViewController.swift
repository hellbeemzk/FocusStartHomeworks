//
//  ModalViewController.swift
//  CollectionApp
//
//  Created by Konstantin on 21.11.2021.
//

import UIKit

final class ModalViewController: UIViewController {
    
    private lazy var ratingLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var buttonToBack : UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Закрыть", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonDidSelected), for: .touchUpInside)
        return button
    }()
    
    var book: Book? {
        didSet {
            guard let book = book else { return }
            ratingLabel.text = "Оценка книги по рейтингу портала LiveLib - \(book.rating)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
}

private extension ModalViewController {
    
    func configureViews() {
        view.backgroundColor = .white
        view.addSubview(buttonToBack)
        view.addSubview(ratingLabel)
        setupButtonLayout()
        setupRatingLabelLayout()
    }
    
    func setupButtonLayout() {
        NSLayoutConstraint.activate([
            buttonToBack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonToBack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.indentForButtonBottomModalVC),
            buttonToBack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.multiplierForLabelWidth)
        ])
    }
    
    func setupRatingLabelLayout() {
        NSLayoutConstraint.activate([
            ratingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ratingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ratingLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.multiplierForLabelWidth)
        ])
    }
    
    @objc
    private func buttonDidSelected() {
        dismiss(animated: true, completion: nil)
    }
}
