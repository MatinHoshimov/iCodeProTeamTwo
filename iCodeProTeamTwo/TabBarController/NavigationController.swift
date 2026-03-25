//
//  NavigationController.swift
//  
//
//  Created by Madina Samadzoda on 26/03/26.
//

import Foundation

private extension MainTabBarController {
    
    func createNav(vc: UIViewController, image: String) -> UINavigationController {
        
        vc.view.backgroundColor = .background
        
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.image = UIImage(systemName: image)
        
        return nav
    }
}
