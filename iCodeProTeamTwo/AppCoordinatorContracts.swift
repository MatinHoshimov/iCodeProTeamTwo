//
//  AppCoordinatorContracts.swift
//  
//
//  Created by Madina Samadzoda on 26/03/26.
//

import Foundation

protocol AppCoordinatorProtocol {
    func makeTabBarControllers() -> [UIViewController]
    func showCreateRecipe()
}
