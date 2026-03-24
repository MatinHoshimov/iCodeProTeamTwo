final class OnboardingCell: UICollectionViewCell {
    
    static let identifier = "OnboardingCell"
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let actionButton = UIButton(type: .system)
    let skipButton = UIButton(type: .system)
    
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = imageView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func configure(with vm: OnboardingCellViewModel) {
        imageView.image = vm.image
        titleLabel.attributedText = vm.title
        actionButton.setTitle(vm.buttonText, for: .normal)
        skipButton.isHidden = vm.isSkipHidden
    }
}

private extension OnboardingCell {
    
    func setupUI() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        actionButton.backgroundColor = .systemRed
        actionButton.layer.cornerRadius = 12
        
        skipButton.setTitle("Skip", for: .normal)
        
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.withAlphaComponent(0.9).cgColor
        ]
        
        imageView.layer.addSublayer(gradientLayer)
    }
    
    func setupLayout() {
        let stack = UIStackView(arrangedSubviews: [actionButton, skipButton])
        stack.axis = .vertical
        stack.spacing = 12
        
        [imageView, titleLabel, stack].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            stack.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            
            actionButton.heightAnchor.constraint(equalToConstant: 56),
            
            titleLabel.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -120),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
}
