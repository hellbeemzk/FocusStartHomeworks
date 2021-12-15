//
//  FirstScreenView.swift
//  CarCatalog
//
//  Created by Konstantin on 13.12.2021.
//

import UIKit

protocol IFirstScreenView: UIView {
    var getNumberOfRowsHandler: (() -> Int)? { get set }
    var getContentForCellHandler: ((Int) -> String)? { get set }
    var onTouchedHandler: ((Int) -> Void)? { get set }
}

final class FirstScreenView: UIView {
    
    private enum Metrics {
        static let rowHeight: CGFloat = 40
        static let fontSizeForLabelSelect: CGFloat = 30
        static let fontSizeForLabelManufacturer: CGFloat = 24
        static let labelSelectTop: CGFloat = 60
        static let labelManufacturerTop: CGFloat = 43
        static let labelManufacturerLeading: CGFloat = 18
        static let tableViewTop: CGFloat = 20
        static let tableViewTrailing: CGFloat = -16
        static let greenColor = UIColor.init(red: 75/255, green: 148/255, blue: 96/255, alpha: 1)
        static let numberOfRows: Int = 0
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.rowHeight = Metrics.rowHeight
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private lazy var labelSelect: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Выберите"
        label.font = UIFont.systemFont(ofSize: Metrics.fontSizeForLabelSelect, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelManufacturer: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Марку машины"
        label.font = UIFont.systemFont(ofSize: Metrics.fontSizeForLabelManufacturer, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var getNumberOfRowsHandler: (() -> Int)?
    var getContentForCellHandler: ((Int) -> String)?
    var onTouchedHandler: ((Int) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
        self.configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension FirstScreenView {
    // не знаю одинаковый ли код стайл у преподавателей, но Михаил говорил, что методы не стоит подписывать приватными, если они находятся в приватном экстеншине. Поэтому я их и не подписал приватными.
    
    func configureLayout() {
        self.setupLayoutLabelSelect()
        self.setupLayoutLabelManufacturer()
        self.setupLayoutTableView()
    }
    
    func configureView() {
        self.backgroundColor = .white
        self.addSubview(tableView)
        self.addSubview(labelSelect)
        self.addSubview(labelManufacturer)
    }
    
    func setupLayoutLabelSelect() {
        NSLayoutConstraint.activate([
            self.labelSelect.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.labelSelectTop),
            self.labelSelect.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    func setupLayoutLabelManufacturer() {
        NSLayoutConstraint.activate([
            self.labelManufacturer.topAnchor.constraint(equalTo: self.labelSelect.bottomAnchor, constant: Metrics.labelManufacturerTop),
            self.labelManufacturer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.labelManufacturerLeading)
        ])
    }
    
    func setupLayoutTableView() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.labelManufacturer.bottomAnchor, constant: Metrics.tableViewTop),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: Metrics.tableViewTrailing),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension FirstScreenView: IFirstScreenView {

}

extension FirstScreenView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.onTouchedHandler?(indexPath.item)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension FirstScreenView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.getNumberOfRowsHandler?() ?? Metrics.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        
        if let manufacturer = self.getContentForCellHandler?(indexPath.row) {
            cell.setNameManufacturer(manufacturer: manufacturer)
        }
        
        if indexPath.row % 2 == 1 {
            cell.greenPointView.backgroundColor = Metrics.greenColor
        }
        return cell
    }
}
