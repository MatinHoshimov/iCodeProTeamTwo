//
//  OnboardingCell.swift
//  
//
//  Created by Madina Samadzoda on 25/03/26.
//

import Foundation

final class OnboardingCell: UICollectionViewCell {
    
    static let identifier = "OnboardingCell"
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let actionButton = UIButton(type: .system)
    private let skipButton = UIButton(type: .system)
    
    private let gradientLayer = CAGradientLayer()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = imageView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        titleLabel.attributedText = nil
        skipButton.isHidden = false
    }
    
    // MARK: - Configure
    func configure(with vm: OnboardingCellViewModel) {
        imageView.image = vm.image
        titleLabel.attributedText = vm.title
        actionButton.setTitle(vm.buttonTitle, for: .normal)
        skipButton.isHidden = vm.isSkipHidden
    }
}
