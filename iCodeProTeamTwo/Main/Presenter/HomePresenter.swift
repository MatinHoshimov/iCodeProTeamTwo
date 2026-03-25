//
//  HomePresenter.swift
//  
//
//  Created by Madina Samadzoda on 26/03/26.
//

import Foundation

final class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeViewProtocol?
    
    private(set) var items: [Recipe] = []
    
    func viewDidLoad() {
        items = [
            Recipe(title: "Pancakes", imageName: "food1"),
            Recipe(title: "Salad", imageName: "food2"),
            Recipe(title: "Soup", imageName: "food3"),
            Recipe(title: "Burger", imageName: "food4")
        ]
        
        view?.reload()
    }
}
