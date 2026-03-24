//
//  AppStorageProtocol.swift
//  
//
//  Created by Madina Samadzoda on 25/03/26.
//

import Foundation

protocol AppStorageProtocol {
    var hasSeenOnboarding: Bool { get set }
}

final class AppStorage: AppStorageProtocol {
    
    private let defaults = UserDefaults.standard
    
    var hasSeenOnboarding: Bool {
        get { defaults.bool(forKey: "hasSeenOnboarding") }
        set { defaults.set(newValue, forKey: "hasSeenOnboarding") }
    }
}
