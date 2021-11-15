//
//  HobbyVC.swift
//  myCV
//
//  Created by Konstantin on 13.11.2021.
//

import UIKit

final class HobbyVC: UIViewController {
    
    private lazy var hobbyImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "football")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        return segment
    }()
    
    private lazy var hobbyText: UILabel = {
        let label = UILabel()
        label.text = Constants.hobbyDescription
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackgroundImage()
        self.configureSegmentedControl()
        self.setViews()
        self.setConstraints()
    }
}

private extension HobbyVC {
    
    private func setConstraints() {
        self.setHobbyImageConstraints()
        self.setSegmentConstraints()
        self.setHobbyTextConstraints()
    }
    
    private func configureSegmentedControl() {
        let segments = ["Football", "Snowboarding"]
        segmentedControl = UISegmentedControl(items: segments)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = UIColor(red: 253/255, green: 118/255, blue: 37/255, alpha: 1.0)
        segmentedControl.backgroundColor = .white
        segmentedControl.addTarget(self, action: #selector(segmentDidChanged(_:)), for: .valueChanged)
    }
    
    @objc
    private func segmentDidChanged(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            hobbyImage.image = UIImage(named: "football")
        case 1:
            hobbyImage.image = UIImage(named: "snowboard")
        default:
            break
        }
    }
    
    private func setSegmentConstraints() {
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
        ])
    }
    
    private func setViews() {
        view.addSubview(hobbyImage)
        view.addSubview(segmentedControl)
        view.addSubview(hobbyText)
    }
    
    private func setHobbyImageConstraints() {
        hobbyImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hobbyImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 4/6),
            hobbyImage.heightAnchor.constraint(equalTo: hobbyImage.widthAnchor, multiplier: 1.385),
            hobbyImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hobbyImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }
    
    private func setHobbyTextConstraints() {
        hobbyText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hobbyText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 4/5),
            hobbyText.topAnchor.constraint(equalTo: hobbyImage.bottomAnchor, constant: 20),
            hobbyText.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg2")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
    }
}
