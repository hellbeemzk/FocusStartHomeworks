//
//  CollectionViewCell.swift
//  CollectionApp
//
//  Created by Konstantin on 29.11.2021.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    private lazy var imageBook: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBlue
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNameBook(name: String) {
        self.nameLabel.text = name
    }
    
    func setImageBook(image: String) {
        self.imageBook.image = UIImage(named: image)
    }
    
    private func configureViews() {
        self.addSubview(imageBook)
        self.addSubview(nameLabel)
        setupLayoutImage()
        setupLayoutName()
    }
    
    func setupLayoutImage() {
        imageBook.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            imageBook.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageBook.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: Metrics.multiplierForImageWidthCell),
            imageBook.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
    
    func setupLayoutName() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: imageBook.trailingAnchor, constant: Metrics.indentForNameCell),
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
