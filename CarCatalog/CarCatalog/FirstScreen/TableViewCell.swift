//
//  TableViewCell.swift
//  CarCatalog
//
//  Created by Konstantin on 13.12.2021.
//

import UIKit

protocol ITableViewCell: UITableViewCell {
    func setNameManufacturer(manufacturer: String)
}

final class TableViewCell: UITableViewCell {
    
    private enum Metrics {
        static let greenColor = UIColor(red: 93/255, green: 176/255, blue: 117/255, alpha: 1)
        static let greenPointCornerRadius: CGFloat = 8
        static let fontSizeForNameManufacturerLabel: CGFloat = 16
        static let fontSizeForLabelSelect: CGFloat = 14
        static let greenPointViewConstrains: CGFloat = 16
        static let nameManufacturerConstrains: CGFloat = 16
    }
    
    static let identifier = "TableViewCell"
    
    lazy var greenPointView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Metrics.greenColor
        view.layer.cornerRadius = Metrics.greenPointCornerRadius
        return view
    }()
    
    private lazy var nameManufacturerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: Metrics.fontSizeForNameManufacturerLabel, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelSelect: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Select"
        label.font = UIFont.systemFont(ofSize: Metrics.fontSizeForLabelSelect)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TableViewCell {
    
    func configureViews() {
        self.addSubview(labelSelect)
        self.addSubview(nameManufacturerLabel)
        self.addSubview(greenPointView)
        self.setupLayoutLabelSelect()
        self.setupLayoutName()
        self.setupLayoutGreenPointView()
    }
    
    func setupLayoutGreenPointView() {
        NSLayoutConstraint.activate([
            self.greenPointView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.greenPointViewConstrains),
            self.greenPointView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.greenPointView.heightAnchor.constraint(equalToConstant: Metrics.greenPointViewConstrains),
            self.greenPointView.widthAnchor.constraint(equalToConstant: Metrics.greenPointViewConstrains)
        ])
    }
    
    func setupLayoutLabelSelect() {
        NSLayoutConstraint.activate([
            self.labelSelect.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.labelSelect.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func setupLayoutName() {
        NSLayoutConstraint.activate([
            self.nameManufacturerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.nameManufacturerLabel.leadingAnchor.constraint(equalTo: self.greenPointView.trailingAnchor, constant: Metrics.nameManufacturerConstrains)
        ])
    }
}

extension TableViewCell: ITableViewCell {

    func setNameManufacturer(manufacturer: String) {
        self.nameManufacturerLabel.text = manufacturer
    }
}
