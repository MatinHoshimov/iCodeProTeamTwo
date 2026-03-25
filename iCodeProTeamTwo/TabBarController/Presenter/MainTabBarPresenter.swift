//
//  MainTabBarPresenter.swift
//  
//
//  Created by Madina Samadzoda on 26/03/26.
//

import Foundation

final class MainTabBarPresenter: MainTabBarPresenterProtocol {
    
    weak var view: MainTabBarViewProtocol?
    
    private let coordinator: AppCoordinatorProtocol
    
    init(coordinator: AppCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func viewDidLoad() {
        let controllers = coordinator.makeTabBarControllers()
        view?.setupViewControllers(controllers)
    }
    
    func didTapPlus() {
        coordinator.showCreateRecipe()
    }
}
