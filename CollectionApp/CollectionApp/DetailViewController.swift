//
//  DetailViewController.swift
//  CollectionApp
//
//  Created by Konstantin on 21.11.2021.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private lazy var imageBook : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var descriptionLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var buttonRatingBook : UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Узнать оценку книги", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonDidSelected), for: .touchUpInside)
        return button
    }()
    
    var book: Book? {
        didSet {
            guard let book = book else { return }
            imageBook.image = UIImage(named: book.image)
            descriptionLabel.text = "Книга - \(book.name). Автор: \(book.author). Жанр: \(book.genre)."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
}

private extension DetailViewController {
    
    func configureViews() {
        view.backgroundColor = .white
        view.addSubview(imageBook)
        view.addSubview(descriptionLabel)
        view.addSubview(buttonRatingBook)
        setupLayoutImageBook()
        setupLayoutDescription()
        setupLayoutButton()
    }
    
    func setupLayoutImageBook() {
        imageBook.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            imageBook.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageBook.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: Constants.indentForImageCenterYDetailVC),
            imageBook.heightAnchor.constraint(equalToConstant: Constants.heightForImageDetailVC),
            imageBook.widthAnchor.constraint(equalToConstant: Constants.widthForImageDetailVC)
        ])
    }
    
    func setupLayoutDescription() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: imageBook.bottomAnchor, constant: Constants.indentBetweenLabelsDetailVC),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.multiplierForLabelWidth)
        ])
    }
    
    func setupLayoutButton() {
        NSLayoutConstraint.activate([
            buttonRatingBook.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Constants.indentBetweenLabelsDetailVC),
            buttonRatingBook.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonRatingBook.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.multiplierForLabelWidth)
        ])
    }
    
    @objc
    func buttonDidSelected(sender: UIButton) {
        let modalVC = ModalViewController()
        modalVC.book = self.book
        self.present(modalVC, animated: true, completion: nil)
    }
}
