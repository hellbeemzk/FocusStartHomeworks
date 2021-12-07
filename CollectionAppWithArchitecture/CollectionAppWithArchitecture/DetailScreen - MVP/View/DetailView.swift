//
//  DetailView.swift
//  CollectionApp
//
//  Created by Konstantin on 29.11.2021.
//

import UIKit

final class DetailView: UIView {
    
    var onTouchedHandler: (() -> Void)?
    
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
    
    @objc private func buttonDidSelected() {
        self.onTouchedHandler?()
    }
    
    func configureViews() {
        self.backgroundColor = .white
        self.addSubview(imageBook)
        self.addSubview(descriptionLabel)
        self.addSubview(buttonRatingBook)
        self.setupLayoutImageBook()
        self.setupLayoutDescription()
        self.setupLayoutButton()
    }
    
    func setContent(book: Book) { 
        self.setDescriptionBook(desc: "Книга - \(book.name). Автор: \(book.author). Жанр: \(book.genre).")
        self.setImageBook(image: book.image)
    }
    
    private func setDescriptionBook(desc: String) {
        self.descriptionLabel.text = desc
    }
    
    private func setImageBook(image: String) {
        self.imageBook.image = UIImage(named: image)
    }
    
    private func setupLayoutImageBook() {
        imageBook.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            imageBook.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageBook.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: Metrics.indentForImageCenterYDetailVC),
            imageBook.heightAnchor.constraint(equalToConstant: Metrics.heightForImageDetailVC),
            imageBook.widthAnchor.constraint(equalToConstant: Metrics.widthForImageDetailVC)
        ])
    }
    
    private func setupLayoutDescription() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: imageBook.bottomAnchor, constant: Metrics.indentBetweenLabelsDetailVC),
            descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: Metrics.multiplierForLabelWidth)
        ])
    }
    
    private func setupLayoutButton() {
        NSLayoutConstraint.activate([
            buttonRatingBook.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Metrics.indentBetweenLabelsDetailVC),
            buttonRatingBook.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonRatingBook.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: Metrics.multiplierForLabelWidth)
        ])
    }
    
}
