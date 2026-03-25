//
//  AppCoordinator.swift
//  
//
//  Created by Madina Samadzoda on 25/03/26.
//

import Foundation

final class AppCoordinator {
    
    private let window: UIWindow
    private let storage: AppStorageProtocol
    
    init(window: UIWindow, storage: AppStorageProtocol) {
        self.window = window
        self.storage = storage
    }
    
    func start() {
        if storage.hasSeenOnboarding {
            showMain()
        } else {
            showOnboarding()
        }
    }
    
    private func showOnboarding() {
        let presenter = OnboardingPresenter(storage: storage)
        let vc = OnboardingViewController(presenter: presenter)
        presenter.view = vc
        
        vc.onFinish = { [weak self] in
            self?.showMain()
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
    
    private func showMain() {
        
        let presenter = MainTabBarPresenter(coordinator: self)
        let tabBar = MainTabBarController(presenter: presenter)
        
        presenter.view = tabBar
        
        window.rootViewController = tabBar
    }
}

extension AppCoordinator: AppCoordinatorProtocol {
    
    func makeTabBarControllers() -> [UIViewController] {
        
        let home = makeNav(vc: HomeViewController(), image: "house")
        let saved = makeNav(vc: SavedViewController(), image: "bookmark")
        
        let empty = UIViewController()
        
        let notifications = makeNav(vc: NotificationsViewController(), image: "bell")
        let profile = makeNav(vc: ProfileViewController(), image: "person")
        
        return [home, saved, empty, notifications, profile]
    }
    
    func showCreateRecipe() {
        let vc = CreateRecipeViewController()
        window.rootViewController?.present(vc, animated: true)
    }
    
    private func makeNav(vc: UIViewController, image: String) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.image = UIImage(systemName: image)
        return nav
    }
}

private func showMain() {
    
    let presenter = MainTabBarPresenter(coordinator: self)
    let tabBar = MainTabBarController(presenter: presenter)
    
    presenter.view = tabBar
    
    window.rootViewController = tabBar
}

extension AppCoordinator {
    
    func makeHome() -> UIViewController {
        let presenter = HomePresenter()
        let vc = HomeViewController(presenter: presenter)
        presenter.view = vc
        return vc
    }
}
