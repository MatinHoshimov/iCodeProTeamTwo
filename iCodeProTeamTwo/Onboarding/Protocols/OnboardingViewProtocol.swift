//
//  OnboardingViewProtocol.swift
//  
//
//  Created by Madina Samadzoda on 25/03/26.
//

import Foundation


protocol OnboardingViewProtocol: AnyObject {
    func reload()
    func scrollTo(index: Int)
    func updatePage(_ index: Int)
    func finish()
}
