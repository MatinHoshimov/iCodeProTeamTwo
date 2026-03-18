//
//  CategoryButton.swift
//  
//
//  Created by Madina Samadzoda on 18/03/26.
//

import Foundation

import UIKit

final class CategoryButton: UIButton {

    // MARK: - Properties

    private var isSelectedCategory: Bool = false

    var onTap: (() -> Void)?

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Setup

    private func setupUI() {

        titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        layer.cornerRadius = Offsets.x3

        setTitleColor(.redPrimary20, for: .normal)
        backgroundColor = .appWhite

        addTarget(self, action: #selector(didTap), for: .touchUpInside)

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: Offsets.x9)
        ])
    }

    // MARK: - Configure

    func configure(title: String, isSelected: Bool) {
        setTitle(title, for: .normal)
        updateSelection(isSelected)
    }

    // MARK: - State

    func updateSelection(_ selected: Bool) {

        isSelectedCategory = selected

        UIView.animate(withDuration: 0.2) {

            self.backgroundColor = selected ? .redPrimary50 : .appWhite
            self.setTitleColor(
                selected ? .appBackground : .redPrimary20,
                for: .normal
            )
        }
    }

    // MARK: - Action

    @objc private func didTap() {
        onTap?()
    }
}
