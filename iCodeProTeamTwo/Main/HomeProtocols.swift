//
//  HomeProtocols.swift
//  
//
//  Created by Madina Samadzoda on 26/03/26.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    func reload()
}

protocol HomePresenterProtocol {
    var items: [Recipe] { get }
    
    func viewDidLoad()
}
