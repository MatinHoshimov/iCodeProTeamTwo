//
//  AppFont.swift
//  
//
//  Created by Madina Samadzoda on 18/03/26.
//

import Foundation

import UIKit

enum AppFont {
    
    static let bold = "Poppins-Bold"
    static let semibold = "Poppins-SemiBold"
    static let regular = "Poppins-Regular"
    
}

extension UIFont {

    static var recipesNavTitle: UIFont {
        UIFont(name: AppFont.bold, size: 24) ?? .systemFont(ofSize: 24, weight: .bold)
    }

    static var recipesMaxTitle: UIFont {
        UIFont(name: AppFont.semibold, size: 20) ?? .systemFont(ofSize: 20, weight: .semibold)
    }

    static var recipesTitle: UIFont {
        UIFont(name: AppFont.semibold, size: 12) ?? .systemFont(ofSize: 12, weight: .semibold)
    }

    static var recipesMiniTitle: UIFont {
        UIFont(name: AppFont.semibold, size: 14) ?? .systemFont(ofSize: 14, weight: .semibold)
    }

    static var placeholderText: UIFont {
        UIFont(name: AppFont.regular, size: 14) ?? .systemFont(ofSize: 14)
    }

    static var commentText: UIFont {
        UIFont(name: AppFont.regular, size: 12) ?? .systemFont(ofSize: 12)
    }

    static var categoryButtonText: UIFont {
        UIFont(name: AppFont.semibold, size: 16) ?? .systemFont(ofSize: 16, weight: .semibold)
    }
}

