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
        
        homeVC.navigationItem.largeTitleDisplayMode = .always
        searchVC.navigationItem.largeTitleDisplayMode = .always
        libraryVC.navigationItem.largeTitleDisplayMode = .always
        
        homeVC.navigationBar.prefersLargeTitles = true
        searchVC.navigationBar.prefersLargeTitles = true
        libraryVC.navigationBar.prefersLargeTitles = true
        
        tabBar.tintColor = .label
        tabBar.backgroundColor = .tertiarySystemBackground
        
        setViewControllers([homeVC, searchVC, libraryVC], animated: true)
        
    }
}

