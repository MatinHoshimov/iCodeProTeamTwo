//
//  TabBarUI.swift
//  
//
//  Created by Madina Samadzoda on 26/03/26.
//

import Foundation
import UIKit

private extension MainTabBarController {
    
    func setupAppearance() {
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .background
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        
        tabBar.tintColor = .primary
        tabBar.unselectedItemTintColor = .tabBarInactive
        
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.05
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -2)
        tabBar.layer.shadowRadius = 8
    }
}

private extension MainTabBarController {
    
    func setupMiddleButton() {
        
        middleButton.frame.size = CGSize(width: 64, height: 64)
        middleButton.backgroundColor = .primary
        middleButton.layer.cornerRadius = 32
        
        middleButton.setImage(UIImage(systemName: "plus"), for: .normal)
        middleButton.tintColor = .white
        
        // тень
        middleButton.layer.shadowColor = UIColor.black.cgColor
        middleButton.layer.shadowOpacity = 0.2
        middleButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        middleButton.layer.shadowRadius = 10
        
        view.addSubview(middleButton)
        
        middleButton.addTarget(self, action: #selector(didTapPlus), for: .touchUpInside)
    }
    
    func positionMiddleButton() {
        middleButton.center = CGPoint(
            x: tabBar.center.x,
            y: tabBar.frame.origin.y - 10
        )
    }
}

@objc private func didTapPlus() {
    print("➕ Add Recipe")
}
