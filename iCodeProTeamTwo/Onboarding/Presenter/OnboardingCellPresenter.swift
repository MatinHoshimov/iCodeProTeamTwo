final class OnboardingPresenter: OnboardingPresenterProtocol {
    
    weak var view: OnboardingViewProtocol?
    
    private let storage: AppStorageProtocol
    
    private var pages: [OnboardingPage] = []
    private(set) var items: [OnboardingCellViewModel] = []
    
    init(storage: AppStorageProtocol) {
        self.storage = storage
    }
    
    func viewDidLoad() {
        pages = makePages()
        items = pages.enumerated().map { makeViewModel(from: $0.element, index: $0.offset) }
        view?.reload()
    }
    
    func didTapAction(at index: Int) {
        if index == items.count - 1 {
            storage.hasSeenOnboarding = true
            view?.finish()
        } else {
            view?.scrollTo(index: index + 1)
        }
    }
    
    func didScroll(to index: Int) {
        view?.updatePage(index)
    }
}

private extension OnboardingPresenter {
    
    func makePages() -> [OnboardingPage] {
        [
            OnboardingPage(imageName: "onboarding0",
                           title: "Best Recipe",
                           highlightedPhrases: [],
                           buttonText: "Get Started"),
            
            OnboardingPage(imageName: "onboarding1",
                           title: "Recipes from all over the World",
                           highlightedPhrases: ["all over the World"],
                           buttonText: "Continue"),
            
            OnboardingPage(imageName: "onboarding2",
                           title: "Recipes with each and every detail",
                           highlightedPhrases: ["each and every detail"],
                           buttonText: "Continue"),
            
            OnboardingPage(imageName: "onboarding3",
                           title: "Cook it now or save it for later",
                           highlightedPhrases: ["save it for later"],
                           buttonText: "Start Cooking")
        ]
    }
    
    func makeViewModel(from page: OnboardingPage, index: Int) -> OnboardingCellViewModel {
        
        let attributed = NSMutableAttributedString(string: page.title)
        let accent = UIColor(red: 238/255, green: 204/255, blue: 147/255, alpha: 1)
        
        page.highlightedPhrases.forEach {
            let range = (page.title as NSString).range(of: $0)
            if range.location != NSNotFound {
                attributed.addAttribute(.foregroundColor, value: accent, range: range)
            }
        }
        
        return OnboardingCellViewModel(
            image: UIImage(named: page.imageName),
            title: attributed,
            buttonText: page.buttonText,
            isSkipHidden: index == 0 || index == 3
        )
    }
}
