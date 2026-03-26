//
//  OnboardingViewController.swift
//  
//
//  Created by Madina Samadzoda on 25/03/26.
//

import Foundation
import UIKit

final class OnboardingViewController: UIViewController {
    
    private let presenter: OnboardingPresenterProtocol
    
    private let collectionView: UICollectionView
    private let pageControl = UIPageControl()
    
    var onFinish: (() -> Void)?
    
    init(presenter: OnboardingPresenterProtocol) {
        self.presenter = presenter
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupUI()
    }
}

extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.identifier, for: indexPath) as! OnboardingCell
        
        let vm = presenter.items[indexPath.item]
        cell.configure(with: vm)
        
        cell.actionButton.tag = indexPath.item
        cell.actionButton.addTarget(self, action: #selector(actionTapped(_:)), for: .touchUpInside)
        
        return cell
    }
}

@objc private func actionTapped(_ sender: UIButton) {
    presenter.didTapAction(at: sender.tag)
}

extension OnboardingViewController: OnboardingViewProtocol {
    
    func reload() {
        collectionView.reloadData()
    }
    
    func scrollTo(index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func updatePage(_ index: Int) {
        pageControl.currentPage = index
    }
    
    func finish() {
        onFinish?()
    }
}
