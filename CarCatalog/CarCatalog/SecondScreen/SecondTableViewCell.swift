//
//  SecondTableViewCell.swift
//  CarCatalog
//
//  Created by Konstantin on 13.12.2021.
//

import UIKit

protocol ISecondTableViewCell {
    func setBodyType(body: String)
    var isSelected: Bool { get set }
}

final class SecondTableViewCell: UITableViewCell {
    
    private enum Metrics {
        static let fontSizeForNameLabel: CGFloat = 16
        static let greenPointColor = UIColor(red: 93/255, green: 176/255, blue: 117/255, alpha: 1)
        static let constraintsForLabels: CGFloat = 16
    }
    
    static let identifier = "SecondTableViewCell"
    
    private lazy var checkPointView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = Metrics.greenPointColor
        view.image = UIImage(systemName: "circle")
        return view
    }()
    
    private lazy var bodyTypeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: Metrics.fontSizeForNameLabel, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SecondTableViewCell {
    
    func configureViews() {
        self.addSubview(checkPointView)
        self.addSubview(bodyTypeLabel)
        self.setupLayoutBodyTypeLabel()
        self.setupLayoutCheckPointView()
    }
    
    func setupLayoutCheckPointView() {
        NSLayoutConstraint.activate([
            self.checkPointView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.checkPointView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.checkPointView.heightAnchor.constraint(equalToConstant: Metrics.constraintsForLabels),
            self.checkPointView.widthAnchor.constraint(equalToConstant: Metrics.constraintsForLabels)
        ])
    }
    
    func setupLayoutBodyTypeLabel() {
        NSLayoutConstraint.activate([
            self.bodyTypeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.bodyTypeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.constraintsForLabels)
        ])
    }
}

extension SecondTableViewCell: ISecondTableViewCell {
    
    func setBodyType(body: String) {
        self.bodyTypeLabel.text = body
    }
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                self.checkPointView.image = UIImage(systemName: "circle.fill")
            } else {
                self.checkPointView.image = UIImage(systemName: "circle")
            }
        }
    }
}
