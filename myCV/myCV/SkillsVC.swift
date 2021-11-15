//
//  SkillsVC.swift
//  myCV
//
//  Created by Konstantin on 13.11.2021.
//

import UIKit

final class SkillsVC: UIViewController {
    
    private lazy var avatarImage: UIImageView = {
        let avatar = UIImageView()
        avatar.contentMode = .scaleAspectFit
        return avatar
    }()
    
    private lazy var skillsText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var mySwitch: UISwitch = {
        let myswitch = UISwitch()
        myswitch.onTintColor = UIColor(red: 253/255, green: 118/255, blue: 37/255, alpha: 1.0)
        return myswitch
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackgroundImage()
        self.setViews()
        self.setConstraints()
        self.switchContent()
    }
}

private extension SkillsVC {
    
    private func setViews() {
        view.addSubview(avatarImage)
        view.addSubview(skillsText)
        view.addSubview(mySwitch)
    }

    private func setConstraints() {
        self.setAvatarConstraints()
        self.setSkillsConstraints()
        self.setSwitchConstraints()
    }
    
    private func setAvatarConstraints() {
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            avatarImage.heightAnchor.constraint(equalTo: avatarImage.widthAnchor, multiplier: 1),
            avatarImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -180)
        ])
    }
    
    private func setSkillsConstraints() {
        skillsText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skillsText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 4/5),
            skillsText.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 20),
            skillsText.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setSwitchConstraints() {
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            mySwitch.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/8),
//            mySwitch.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 300),
            mySwitch.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            mySwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func switchContent() {
        if mySwitch.isOn {
            skillsText.text = Constants.skillsDescription
            avatarImage.image = UIImage(named: "ava6")
        } else {
            skillsText.text = Constants.skillsDescriptionJoke
            avatarImage.image = UIImage(named: "vrun2")
        }
        mySwitch.addTarget(self, action: #selector(SkillsVC.switchDidChanged(_:)), for: .valueChanged)
    }
    
    @objc
    private func switchDidChanged(_ sender: UISwitch) {
        if (sender.isOn == true) {
            skillsText.text = Constants.skillsDescription
            avatarImage.image = UIImage(named: "ava6")
        } else {
            skillsText.text = Constants.skillsDescriptionJoke
            avatarImage.image = UIImage(named: "vrun2")
        }
    }
    
    private func setBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg2")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
    }
}
