//
//  HomeViewController.swift
//  
//
//  Created by Madina Samadzoda on 26/03/26.
//

import Foundation
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
        presenter.viewDidLoad()
    }
}

private extension HomeViewController {
    
    func setupCollection() {
        view.addSubview(collectionView)
        
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .background
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(RecipeCell.self, forCellWithReuseIdentifier: "RecipeCell")
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
        
        let item = presenter.items[indexPath.item]
        cell.configure(with: item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 30) / 2
        return CGSize(width: width, height: width + 60)
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
        titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
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
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
}
