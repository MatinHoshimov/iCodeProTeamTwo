//
//  OnboardingCellPresenter.swift
//  
//
//  Created by Madina Samadzoda on 25/03/26.
//

import Foundation

private extension OnboardingCell {
    
    func setupUI() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 32)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        actionButton.backgroundColor = UIColor(named: "primary50") ?? .systemRed
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.layer.cornerRadius = 12
        
        skipButton.setTitle("Skip", for: .normal)
        
        setupGradient()
    }
    
    func setupGradient() {
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.withAlphaComponent(0.95).cgColor
        ]
        gradientLayer.locations = [0.3, 1.0]
        imageView.layer.addSublayer(gradientLayer)
    }
    
    func setupLayout() {
        let bottomStack = UIStackView(arrangedSubviews: [actionButton, skipButton])
        bottomStack.axis = .vertical
        bottomStack.spacing = 12
        
        [imageView, titleLabel, bottomStack].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            bottomStack.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            bottomStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            bottomStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            
            actionButton.heightAnchor.constraint(equalToConstant: 56),
            
            titleLabel.bottomAnchor.constraint(equalTo: bottomStack.topAnchor, constant: -140),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25)
        ])
    }
}

func makeViewModel(from page: OnboardingPage) -> OnboardingCellViewModel {
    
    let attributed = NSMutableAttributedString(string: page.title)
    
    page.highlightedPhrases.forEach {
        let range = (page.title as NSString).range(of: $0)
        if range.location != NSNotFound {
            attributed.addAttribute(.foregroundColor, value: UIColor.orange, range: range)
        }
    }
    
    return OnboardingCellViewModel(
        image: UIImage(named: page.imageName),
        attributedTitle: attributed,
        buttonText: page.buttonText
    )
}
