//
//  Categories.swift
//  
//
//  Created by Madina Samadzoda on 26/03/26.
//

import Foundation

var categories: [Category] = []

func viewDidLoad() {
    
    categories = [
        Category(title: "All"),
        Category(title: "Breakfast"),
        Category(title: "Lunch"),
        Category(title: "Dinner"),
        Category(title: "Dessert")
    ]
    
    items = [...]
    
    view?.reload()
}
