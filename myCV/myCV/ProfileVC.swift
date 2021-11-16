//
//  ProfileVC.swift
//  myCV
//
//  Created by Konstantin on 13.11.2021.
//

import UIKit

final class ProfileVC: UIViewController {
    
    private lazy var avatarImageView: UIView = {
        let avatarImage = UIImageView()
        avatarImage.image = UIImage(named: "ava4")
        avatarImage.contentMode = .scaleAspectFit
        return avatarImage
    }()
    
    private lazy var profileName: UILabel = {
        let label = UILabel()
        label.text = "💻 Константин Матвиенко"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        return label
    }()
    
    private lazy var profileText: UILabel = {
        let label = UILabel()
        label.text = Constants.profileDescription
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackgroundImage()
        self.setViews()
        self.setConstraints()
    }
}

private extension ProfileVC {
    
    func setViews() {
        view.addSubview(avatarImageView)
        view.addSubview(profileName)
        view.addSubview(profileText)
    }
    
    func setConstraints() {
        self.setAvatarConstraints()
        self.setNameConstraints()
        self.setTextConstraints()
    }
    
    func setAvatarConstraints() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor, multiplier: 1),
            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -180)
        ])
    }
    
    func setNameConstraints() {
        profileName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileName.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 30),
            profileName.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setTextConstraints() {
        profileText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 4/5),
            profileText.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 30),
            profileText.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    func setBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg2")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
    }
}
