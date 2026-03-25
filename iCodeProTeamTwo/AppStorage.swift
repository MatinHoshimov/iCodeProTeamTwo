//
//  AppStorage.swift
//  
//
//  Created by Madina Samadzoda on 26/03/26.
//

import Foundation

protocol AppStorageProtocol {
    var hasSeenOnboarding: Bool { get set }
}

final class AppStorage: AppStorageProtocol {
    
    private let defaults = UserDefaults.standard
    
    private enum Keys {
        static let hasSeenOnboarding = "hasSeenOnboarding"
    }
    
    var hasSeenOnboarding: Bool {
        get { defaults.bool(forKey: Keys.hasSeenOnboarding) }
        set { defaults.set(newValue, forKey: Keys.hasSeenOnboarding) }
    }
}
