//
//  SceneDelegate.swift
//  CollectionApp
//
//  Created by Konstantin on 29.11.2021.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let booksListVC = BooksViewController()
        let navigation = UINavigationController(rootViewController: booksListVC)
        
        self.window = window
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
}

