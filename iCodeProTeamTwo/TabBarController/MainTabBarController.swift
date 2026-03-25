//
//  MainTabBarController.swift
//  
//
//  Created by Madina Samadzoda on 26/03/26.
//

import Foundation

import UIKit

final class MainTabBarController: UITabBarController {
    
    private let presenter: MainTabBarPresenterProtocol
    private let middleButton = UIButton()
    
    init(presenter: MainTabBarPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        setupMiddleButton()
        
        presenter.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        positionMiddleButton()
    }
}
