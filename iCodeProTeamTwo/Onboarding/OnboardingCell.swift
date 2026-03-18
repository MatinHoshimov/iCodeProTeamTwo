//
//  OnboardingCell.swift
//  iCodeProTeamTwo
//
//  Created by Administration  on 13/03/26.
//
import UIKit

class OnboardingCell: UICollectionViewCell {
    static let identifier = "OnboardingCell"
    
    // MARK: - UI Elements
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let gradientLayer = CAGradientLayer()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        // Уменьшили размер до 32 для лучшей читаемости
        label.font = UIFont(name: "Poppins-Bold", size: 32) ?? .boldSystemFont(ofSize: 32)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(named: "primary50") ?? .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16) ?? .systemFont(ofSize: 16, weight: .semibold)
        return button
    }()
    
    let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 14) ?? .systemFont(ofSize: 14)
        return button
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError() }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = contentView.bounds
    }

    // MARK: - Setup
    func setup(_ slide: OnboardingSlide, index: Int) {
        imageView.image = slide.image
        actionButton.setTitle(slide.buttonTitle, for: .normal)
        
        let accentColor = UIColor(red: 238/255, green: 204/255, blue: 147/255, alpha: 1.0)
        let attributedString = NSMutableAttributedString(string: slide.title)
        
        let phrases = ["all over the World", "each and every detail", "save it for later"]
        
        for phrase in phrases {
            let range = (slide.title as NSString).range(of: phrase)
            if range.location != NSNotFound {
                attributedString.addAttribute(.foregroundColor, value: accentColor, range: range)
            }
        }
        
        titleLabel.attributedText = attributedString
        skipButton.isHidden = (index == 0 || index == 3)
    }
    
    private func setupUI() {
        // Добавляем градиент
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.95).cgColor]
        gradientLayer.locations = [0.3, 1.0]
        imageView.layer.addSublayer(gradientLayer)

        // Используем StackView для кнопок (нижняя панель)
        let bottomStack = UIStackView(arrangedSubviews: [actionButton, skipButton])
        bottomStack.axis = .vertical
        bottomStack.spacing = 12
        bottomStack.alignment = .fill
        [imageView, titleLabel, bottomStack].forEach {
                    $0.translatesAutoresizingMaskIntoConstraints = false
                    contentView.addSubview($0)
                }
                
                NSLayoutConstraint.activate([
                    // Картинка на весь экран
                    imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                    imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                    imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                    imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                    
                    // Стэк кнопок внизу
                    bottomStack.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -20),
                    bottomStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
                    bottomStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
                    
                    // Высота кнопки
                    actionButton.heightAnchor.constraint(equalToConstant: 56),
                    
                    // Текст (прижат к стэку кнопок, но с ОЧЕНЬ большим отступом для точек)
                    // Мы делаем отступ 140, чтобы PageControl в контроллере поместился между ними
                    titleLabel.bottomAnchor.constraint(equalTo: bottomStack.topAnchor, constant: -140),
                    titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
                    titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25)
                ])
            }
        }
