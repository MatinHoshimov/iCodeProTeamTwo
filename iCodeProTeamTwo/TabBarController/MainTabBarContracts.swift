//
//  MainTabBarContracts.swift
//  
//
//  Created by Madina Samadzoda on 26/03/26.
//

import Foundation

protocol MainTabBarViewProtocol: AnyObject {
    func setupViewControllers(_ controllers: [UIViewController])
}

protocol MainTabBarPresenterProtocol {
    func viewDidLoad()
    func didTapPlus()
}

