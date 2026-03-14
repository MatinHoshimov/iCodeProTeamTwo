//
//  OnboardingViewController.swift
//  iCodeProTeamTwo
//
//  Created by Administration  on 13/03/26.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: - Properties
    private var slides: [OnboardingSlide] = []
    private var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            // На первом слайде индикатор обычно скрывают по дизайну, но если нужен — оставляем
            pageControl.isHidden = (currentPage == 0)
        }
    }
    
    private var timer: Timer?

    // MARK: - UI Elements
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .black
        cv.dataSource = self
        cv.delegate = self
        cv.register(OnboardingCell.self, forCellWithReuseIdentifier: OnboardingCell.identifier)
        return cv
    }()

    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPageIndicatorTintColor = UIColor(red: 238/255, green: 204/255, blue: 147/255, alpha: 1.0) // Бежевый
        pc.pageIndicatorTintColor = .systemGray
        pc.isUserInteractionEnabled = false
        // Делаем точки чуть длиннее (эффект черточек)
        pc.transform = CGAffineTransform(scaleX: 1.3, y: 1.0)
        return pc
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
        startTimer()
    }

    private func setupData() {
        // Чистый массив без лишних вложений
        slides = [
            OnboardingSlide(title: "Best \nRecipe",
                            image: UIImage(named: "onboarding0") ?? UIImage(),
                            buttonTitle: "Get Started"),
            
            OnboardingSlide(title: "Recipes from \nall over the World",
                            image: UIImage(named: "onboarding1") ?? UIImage(),
                            buttonTitle: "Continue"),
            
            OnboardingSlide(title: "Recipes with \neach and every detail",
                            image: UIImage(named: "onboarding2") ?? UIImage(),
                            buttonTitle: "Continue"),
            
            OnboardingSlide(title: "Cook it now or \nsave it for later",
                            image: UIImage(named: "onboarding3") ?? UIImage(),
                            buttonTitle: "Start Cooking")
        ]
        pageControl.numberOfPages = slides.count
    }

    private func setupUI() {
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        
        collectionView.frame = view.bounds
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // располагаем точки над текстом (примерно как в Figma)
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -230),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    // MARK: - Timer Logic
    private func startTimer() {
        stopTimer() // На всякий случай сбрасываем старый
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    @objc private func slideToNext() {
        if currentPage < slides.count - 1 {
            currentPage += 1
        } else {
            currentPage = 0
        }
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

    @objc private func handleAction() {
        if currentPage < slides.count - 1 {
            slideToNext()
        } else {
            print("Переход в основное приложение")
        }
    }
}
// MARK: - CollectionView Delegate & DataSource
extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.identifier, for: indexPath) as! OnboardingCell
        
        // Передаем индекс, чтобы ячейка знала, какое слово красить
        cell.setup(slides[indexPath.item], index: indexPath.item)
        
        // Удаляем старые таргеты, чтобы не копились, и добавляем новый
        cell.actionButton.removeTarget(nil, action: nil, for: .allEvents)
        cell.actionButton.addTarget(self, action: #selector(handleAction), for: .touchUpInside)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return view.bounds.size
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        stopTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        startTimer()
    }
}
