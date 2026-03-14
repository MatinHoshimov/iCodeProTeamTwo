//
//  SceneDelegate.swift
//  iCodeProTeamTwo
//
//  Created by Administration  on 13/03/26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // 1. Проверяем, что scene — это именно UIWindowScene
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // 2. Создаем новое окно (Window) вручную
        let window = UIWindow(windowScene: windowScene)
        
        // 3. Указываем твой контроллер онбординга как корневой (Root)
        let rootVC = OnboardingViewController()
        
        // 4. Помещаем его в NavigationController (если планируешь переходы дальше)
        // Либо просто: window.rootViewController = rootVC
        window.rootViewController = rootVC
        
        // 5. Сохраняем и показываем окно
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}
