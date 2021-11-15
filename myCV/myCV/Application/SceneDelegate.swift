//
//  SceneDelegate.swift
//  myCV
//
//  Created by Konstantin on 13.11.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let scene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: scene)
            let tabBarController = self.createTabBarController()
            window.rootViewController = tabBarController
            self.window = window
            self.window?.makeKeyAndVisible()
        }
    }
}


private extension SceneDelegate {
    func createTabBarController() -> UITabBarController {
        let tabBar = UITabBarController()
        let profileVC = ProfileVC()
        let skillsVC = SkillsVC()
        let hobbyVC = HobbyVC()
        profileVC.tabBarItem = self.createFirstTab()
        skillsVC.tabBarItem = self.createSecondTab()
        hobbyVC.tabBarItem = self.createThirdTab()
        
        UITabBar.appearance().tintColor = UIColor(red: 253/255, green: 118/255, blue: 37/255, alpha: 1.0)
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        
        tabBar.setViewControllers([profileVC, skillsVC, hobbyVC], animated: false)
        return tabBar
    }

    func createFirstTab() -> UITabBarItem {
        let item = UITabBarItem(title: "Обо мне", image: UIImage(systemName: "person.circle"), tag: 0)
        return item
    }

    func createSecondTab() -> UITabBarItem {
        let item = UITabBarItem(title: "Опыт", image: UIImage(systemName: "folder.circle"), tag: 1)
        return item
    }

    func createThirdTab() -> UITabBarItem {
        let item = UITabBarItem(title: "Хобби", image: UIImage(systemName: "flame.circle"), tag: 2)
        return item
    }
    
}


