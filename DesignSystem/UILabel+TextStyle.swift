//
//  UILabel+TextStyle.swift
//  
//
//  Created by Madina Samadzoda on 18/03/26.
//

import Foundation

extension UILabel {

    func recipesNavTitleStyle() {
        font = .recipesNavTitle
        textColor = .neutral100
    }

    func recipesPlaceholderStyle() {
        font = .placeholderText
        textColor = .neutral30
    }

    func commentStyle() {
        font = .commentText
        textColor = .neutral30
    }

    func recipesMaxTitleStyle() {
        font = .recipesMaxTitle
        textColor = .neutral100
    }

    func recipesTitleStyle() {
        font = .recipesTitle
        textColor = .neutral100
    }

    func recipesSeeAllTextStyle() {
        font = .recipesMiniTitle
        textColor = .redPrimary50
    }

    func recipesCategoryButtonStyle() {
        font = .categoryButtonText
        textColor = .redPrimary20
    }

}
