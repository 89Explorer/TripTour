//
//  WelcomeViewController.swift
//  TripTour
//
//  Created by 권정근 on 6/18/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let mainLabeltext: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Discover Local"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    private let subLabeltext: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Find top attractions, restaurants and hidden gems nearby."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private let signInImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "tripTour.png")
        // imageView.backgroundColor = .systemRed
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let signInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBrown
        button.setTitle("Explorer Now", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(mainLabeltext)
        view.addSubview(signInButton)
        view.addSubview(signInImageView)
        view.addSubview(subLabeltext)
        

        
        signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        
        configureConstraints()
    }

    
    @objc private func didTapSignInButton() {
        let authVC = AuthViewController()
        
        authVC.navigationItem.largeTitleDisplayMode = .always
        authVC.modalPresentationStyle = .popover
//        navigationController?.pushViewController(authVC, animated: true)
        present(authVC, animated: true)
    }
    
    private func configureConstraints() {
        
        let mainLabeltextConstraints = [
            mainLabeltext.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabeltext.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5)
        ]
        
        let subLabeltextConstraint = [
            subLabeltext.topAnchor.constraint(equalTo: mainLabeltext.bottomAnchor, constant: 8),
            subLabeltext.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            subLabeltext.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ]
        
        let signInImageViewConstraints = [
            signInImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInImageView.topAnchor.constraint(equalTo: subLabeltext.bottomAnchor, constant: 30),
            signInImageView.widthAnchor.constraint(equalToConstant: 350),
            signInImageView.heightAnchor.constraint(equalToConstant: 350)
        ]
        
        let signInButtonConstraints = [
            signInButton.topAnchor.constraint(equalTo: signInImageView.bottomAnchor, constant: 30),
            signInButton.heightAnchor.constraint(equalToConstant: 48),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ]
        
        NSLayoutConstraint.activate(mainLabeltextConstraints)
        NSLayoutConstraint.activate(subLabeltextConstraint)
        NSLayoutConstraint.activate(signInImageViewConstraints)
        NSLayoutConstraint.activate(signInButtonConstraints)
    }
}
