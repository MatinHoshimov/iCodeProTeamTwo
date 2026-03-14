//
//  UIFont.swift
//  iCodeProTeamTwo
//
//  Created by Administration  on 13/03/26.
//


import UIKit

extension UIFont {
    static func bold(size: CGFloat) -> UIFont {
        return .systemFont(ofSize: size, weight: .bold)
    }
    
    static func semibold(size: CGFloat) -> UIFont {
        return .systemFont(ofSize: size, weight: .semibold)
    }
}

extension UIColor {
    //static var primary50: UIColor {
    // return UIColor(named: "primary50") ?? .systemRed
}

