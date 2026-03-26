import UIKit

final class HomeViewController: UIViewController {
    
    private let presenter: HomePresenterProtocol
    private let collectionView: UICollectionView
    
    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        
        setupCollection()
        setupConstraints()
        
        presenter.viewDidLoad()
    }
}

private extension HomeViewController {
    
    func setupCollection() {
        collectionView.backgroundColor = .background
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(RecipeCell.self, forCellWithReuseIdentifier: "RecipeCell")
        
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Data
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.items.count
    }
    
    // MARK: - Cell
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "RecipeCell",
            for: indexPath
        ) as? RecipeCell else {
            return UICollectionViewCell()
        }
        
        let item = presenter.items[indexPath.item]
        cell.configure(with: item)
        
        return cell
    }
    
    // MARK: - Layout
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 16
        let spacing: CGFloat = 8
        
        let totalWidth = collectionView.bounds.width
        let width = (totalWidth - padding * 2 - spacing) / 2
        
        return CGSize(width: width, height: width + 60)
    }
    
    // MARK: - Selection 🔥
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let recipe = presenter.items[indexPath.item]
        
        let vc = DetailViewController(recipe: recipe)
        navigationController?.pushViewController(vc, animated: true)
    }
}

final class RecipeCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func configure(with recipe: Recipe) {
        imageView.image = UIImage(named: recipe.imageName)
        titleLabel.text = recipe.title
    }
}

private extension RecipeCell {
    
    func setupUI() {
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 16
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        titleLabel.textColor = .textPrimary
        titleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        
        [imageView, titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
