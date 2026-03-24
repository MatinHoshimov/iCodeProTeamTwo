//
//  OnboardingPresenterProtocol.swift
//  
//
//  Created by Madina Samadzoda on 25/03/26.
//

import Foundation

protocol OnboardingPresenterProtocol {
    var items: [OnboardingCellViewModel] { get }
    
    func viewDidLoad()
    func didTapAction(at index: Int)
    func didScroll(to index: Int)
}
