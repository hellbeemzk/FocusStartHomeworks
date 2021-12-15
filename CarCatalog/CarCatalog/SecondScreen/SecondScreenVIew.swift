//
//  SecondScreenVIew.swift
//  CarCatalog
//
//  Created by Konstantin on 16.12.2021.
//

import UIKit

protocol ISecondScreenView: UIView {
    var getNumberOfRowsHandler: (() -> Int)? { get set }
    var calculatePriceHandler: (() -> Void)? { get set }
    var getContentForCellHandler: ((Int) -> String)? { get set }
    var onTouchedHandler: ((Int) -> String)? { get set }
    func setDefaultImageCar(with image: String)
    func setPriceCar(price: String)
}

final class SecondScreenView: UIView {
    
    private enum Metrics {
        static let fontSizeForLabels: CGFloat = 24
        static let fontSizeForLabelPrice: CGFloat = 16
        static let backgroundColorForButton = UIColor(red: 93/255, green: 176/255, blue: 117/255, alpha: 1)
        static let tableViewRowHeight: CGFloat = 40
        static let cornerRadiusForButton: CGFloat = 25
        static let NumberOfRows: Int = 0
        static let imageCarTop: CGFloat = 86
        static let imageCarHeight: CGFloat = 196
        static let activityIndicatorTop: CGFloat = 50
        static let labelPriceTop: CGFloat = 23
        static let constraintsForLabels: CGFloat = 16
        static let labelCurrentPriceTop: CGFloat = 8
        static let labelBodyTypeTop: CGFloat = 50
        static let secondTableViewBottom: CGFloat = -10
        static let buttonForPriceTop: CGFloat = -95
        static let buttonForPriceHeight: CGFloat = 50
    }
    
    private lazy var secondTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SecondTableViewCell.self, forCellReuseIdentifier: SecondTableViewCell.identifier)
        tableView.rowHeight = Metrics.tableViewRowHeight
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private lazy var activityIndicator = UIActivityIndicatorView()
    
    private lazy var imageCar: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var labelCurrentPrice: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: Metrics.fontSizeForLabelPrice, weight: .semibold) // semibold
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelPrice: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Цена"
        label.font = UIFont.systemFont(ofSize: Metrics.fontSizeForLabels, weight: .semibold) // semibold
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelBodyType: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Выберите тип кузова"
        label.font = UIFont.systemFont(ofSize: Metrics.fontSizeForLabels, weight: .medium) // semibold
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var buttonForPrice: UIButton = {
        let button = UIButton()
        button.backgroundColor = Metrics.backgroundColorForButton
        button.setTitle("Рассчитать цену", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = Metrics.cornerRadiusForButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonDidSelected), for: .touchUpInside)
        return button
    }()
    
    @objc private func buttonDidSelected() {
        self.calculatePriceHandler?()
    }
    
    var getNumberOfRowsHandler: (() -> Int)?
    var calculatePriceHandler: (() -> Void)?
    var getContentForCellHandler: ((Int) -> String)?
    var onTouchedHandler: ((Int) -> String)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configuireView()
        self.configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SecondScreenView {
    
    func configuireView() {
        self.backgroundColor = .white
        self.addSubview(imageCar)
        self.addSubview(activityIndicator)
        self.addSubview(buttonForPrice)
        self.addSubview(labelCurrentPrice)
        self.addSubview(labelPrice)
        self.addSubview(labelBodyType)
        self.addSubview(secondTableView)
    }
    
    func configureLayout() {
        self.setupLayoutImageCar()
        self.setupLayoutLabelPrice()
        self.setupLayoutLabelBody()
        self.setupLayoutLabelCurrentPrice()
        self.setupLayoutTableView()
        self.setupLayoutButton()
        self.setupLayoutActivityIndicator()
    }
    
    func showActivityIndicator() {
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
    }
    
    func unCheckedAllCells() {
        var allCells = [SecondTableViewCell]()
        for i in 0..<self.secondTableView.numberOfSections {
            for j in 0..<self.secondTableView.numberOfRows(inSection: i) {
                if let cell = self.secondTableView.cellForRow(at: IndexPath(row: j, section: i)) as? SecondTableViewCell {
                    allCells.append(cell)
                }
            }
        }
        for cell in allCells {
            cell.isSelected = false
        }
    }
    
    func setupLayoutImageCar() {
        NSLayoutConstraint.activate([
            self.imageCar.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.imageCarTop),
            self.imageCar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageCar.heightAnchor.constraint(equalToConstant: Metrics.imageCarHeight),
            self.imageCar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.constraintsForLabels),
            self.imageCar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.constraintsForLabels)
        ])
    }
    
    func setupLayoutActivityIndicator() {
        self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.activityIndicator.topAnchor.constraint(equalTo: imageCar.bottomAnchor, constant: Metrics.activityIndicatorTop)
        ])
    }
    
    func setupLayoutLabelPrice() {
        NSLayoutConstraint.activate([
            self.labelPrice.topAnchor.constraint(equalTo: self.imageCar.bottomAnchor, constant: Metrics.labelPriceTop),
            self.labelPrice.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.constraintsForLabels)
        ])
    }
    
    func setupLayoutLabelCurrentPrice() {
        NSLayoutConstraint.activate([
            self.labelCurrentPrice.topAnchor.constraint(equalTo: self.labelPrice.bottomAnchor, constant: Metrics.labelCurrentPriceTop),
            self.labelCurrentPrice.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.constraintsForLabels)
        ])
    }
    
    func setupLayoutLabelBody() {
        NSLayoutConstraint.activate([
            self.labelBodyType.topAnchor.constraint(equalTo: self.labelPrice.bottomAnchor, constant: Metrics.labelBodyTypeTop),
            self.labelBodyType.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.constraintsForLabels)
        ])
    }
    
    func setupLayoutTableView() {
        NSLayoutConstraint.activate([
            self.secondTableView.topAnchor.constraint(equalTo: self.labelBodyType.bottomAnchor, constant: Metrics.constraintsForLabels),
            self.secondTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.secondTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -Metrics.constraintsForLabels),
            self.secondTableView.bottomAnchor.constraint(equalTo: self.buttonForPrice.topAnchor, constant: Metrics.secondTableViewBottom)
        ])
    }
    
    func setupLayoutButton() {
        NSLayoutConstraint.activate([
            self.buttonForPrice.topAnchor.constraint(equalTo: self.bottomAnchor, constant: Metrics.buttonForPriceTop),
            self.buttonForPrice.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.buttonForPrice.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.constraintsForLabels),
            self.buttonForPrice.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -Metrics.constraintsForLabels),
            self.buttonForPrice.heightAnchor.constraint(equalToConstant: Metrics.buttonForPriceHeight)
        ])
    }
}


extension SecondScreenView: ISecondScreenView {
    
    func setDefaultImageCar(with image: String) {
        self.imageCar.image = UIImage(named: image)
        self.secondTableView.reloadData()
    }
    
    func setPriceCar(price: String) {
        self.showActivityIndicator()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.labelCurrentPrice.text = price
            self.hideActivityIndicator()
        }
    }
}

extension SecondScreenView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let bodyType = self.onTouchedHandler?(indexPath.item) {
            self.imageCar.image = UIImage(named: bodyType)
        }
        
        self.unCheckedAllCells()
        
        let cell = tableView.cellForRow(at: indexPath) as? SecondTableViewCell
        cell?.isSelected = true
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SecondScreenView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.getNumberOfRowsHandler?() ?? Metrics.NumberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.identifier, for: indexPath) as! SecondTableViewCell
        
        if let bodyType = self.getContentForCellHandler?(indexPath.row) {
            cell.setBodyType(body: bodyType)
        }
        
        if indexPath.row == .zero {
            cell.isSelected = true
        }
        return cell
    }
}
