//
//  HomeViewController.swift
//  TripTour
//
//  Created by 권정근 on 6/18/24.
//

import UIKit
import Firebase


class HomeViewController: UIViewController {

    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home "
        view.backgroundColor = .systemBrown
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .plain, target: self, action: #selector(didTapSignOut))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    
    // MARK: - Functions
    private func handleAuthentication() {
        if Auth.auth().currentUser == nil {
            let welcomeVC = UINavigationController(rootViewController: WelcomeViewController())
            welcomeVC.modalPresentationStyle = .fullScreen
            present(welcomeVC, animated: false)
        }
    }
    
    @objc private func didTapSignOut() {
        try? Auth.auth().signOut()
        handleAuthentication()
    }
}
