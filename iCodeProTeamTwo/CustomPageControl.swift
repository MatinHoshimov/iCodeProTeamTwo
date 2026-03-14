//
//  CustomPageControl.swift
//  iCodeProTeamTwo
//
//  Created by Administration  on 13/03/26.
//


import UIKit

class CustomPageControl: UIView {
    private let stackView = UIStackView()
    private var indicators: [UIView] = []
    
    var numberOfPages: Int = 0 {
        didSet { setupIndicators() }
    }
    
    var currentPage: Int = 0 {
        didSet { updateSelection() }
    }
    
    private func setupIndicators() {
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.distribution = .fill
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        for _ in 0..<numberOfPages {
            let view = UIView()
            view.backgroundColor = .systemGray4
            view.layer.cornerRadius = 2
            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalToConstant: 20).isActive = true
            view.heightAnchor.constraint(equalToConstant: 4).isActive = true
            stackView.addArrangedSubview(view)
            indicators.append(view)
        }
        updateSelection()
    }
    
    private func updateSelection() {
        for (index, view) in indicators.enumerated() {
            // На дизайне активная полоска — primary50, остальные — нейтральные
            view.backgroundColor = index == currentPage ? .primary50 : .systemGray4
            // Можно анимировать ширину, если захочешь (index == currentPage ? 30 : 20)
        }
    }
}