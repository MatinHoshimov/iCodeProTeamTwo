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
        window.rootViewController = MainTabBarController()
    }
}
