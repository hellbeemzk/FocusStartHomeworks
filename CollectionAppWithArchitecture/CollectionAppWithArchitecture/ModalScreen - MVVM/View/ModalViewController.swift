//
//  ModalViewController.swift
//  CollectionApp
//
//  Created by Konstantin on 29.11.2021.
//

import UIKit

final class ModalViewController: UIViewController {
    
    let viewModel = ViewModel()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        setRatingLabel()
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
    
    func setRatingLabel() {
        self.viewModel.data.setNotify { [weak self] text in
            self?.ratingLabel.text = text
        }
    }
    
    @objc
    private func buttonDidSelected() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupButtonLayout() {
        NSLayoutConstraint.activate([
            buttonToBack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonToBack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Metrics.indentForButtonBottomModalVC),
            buttonToBack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Metrics.multiplierForLabelWidth)
        ])
    }
    
    func setupRatingLabelLayout() {
        NSLayoutConstraint.activate([
            ratingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ratingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ratingLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Metrics.multiplierForLabelWidth)
        ])
    }
}
