//
//  BackgroundRatingViewStyle.swift
//  
//
//  Created by Madina Samadzoda on 18/03/26.
//

import Foundation

import UIKit

extension UIView {

    func applyBackgroundRatingStyle(
        cornerRadius: CGFloat = Offsets.x2
    ) {

        backgroundColor = UIColor.backgrountRatingView.withAlphaComponent(0.5)

        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true

        layoutMargins = UIEdgeInsets(
            top: Offsets.x1,
            left: Offsets.x2,
            bottom: Offsets.x1,
            right: Offsets.x2
        )
    }
}
