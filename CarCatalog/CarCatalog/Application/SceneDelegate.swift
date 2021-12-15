//
//  SceneDelegate.swift
//  CarCatalog
//
//  Created by Konstantin on 13.12.2021.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let vc = FirstScreenAssembly.build()
        let navigation = UINavigationController(rootViewController: vc)
        
        self.window = window
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
}

