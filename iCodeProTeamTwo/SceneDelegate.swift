//
//  SceneDelegate.swift
//  iCodeProTeamTwo
//
//  Created by Administration  on 13/03/26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?

    func scene(
            _ scene: UIScene,
            willConnectTo session: UISceneSession,
            options connectionOptions: UIScene.ConnectionOptions
        ) {
            guard let windowScene = (scene as? UIWindowScene) else { return }
            
            let window = UIWindow(windowScene: windowScene)
            
            let storage = AppStorage()
            coordinator = AppCoordinator(window: window, storage: storage)
            coordinator?.start()
        
        // 5. Сохраняем и показываем окно
        self.window = window
        //window.makeKeyAndVisible()
        //window.rootViewController = MainTabBarController()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}
