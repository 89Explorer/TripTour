//
//  ViewController.swift
//  TripTour
//
//  Created by 권정근 on 6/17/24.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBrown
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let libraryVC = UINavigationController(rootViewController: LibraryViewController())
        
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        libraryVC.tabBarItem.image = UIImage(systemName: "book.pages")
        
        homeVC.title = "Home"
        searchVC.title = "Search"
        libraryVC.title = "Library"
        
        
        tabBar.tintColor = .label
        tabBar.backgroundColor = .systemGray6
        
        setViewControllers([homeVC, searchVC, libraryVC], animated: true)
        
    }
}

