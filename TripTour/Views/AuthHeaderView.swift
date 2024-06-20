//
//  AuthHeaderView.swift
//  TripTour
//
//  Created by 권정근 on 6/20/24.
//

import UIKit

class AuthHeaderView: UIView {
    
    // MARK: - UI Components
    private let authImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "authImage.png")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.text = "error"
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "error"
        return label
    }()
    

    // MARK: - Life Cycle
    init(title: String, subTitle: String) {
        super.init(frame: .zero)
        
        titleLabel.text = title
        subTitleLabel.text = subTitle
        
        addSubview(authImageView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: - UI Constraints
    private func configureConstraints() {
        
        let authImageViewConstraints = [
            authImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            authImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            authImageView.widthAnchor.constraint(equalToConstant: 250)
        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: authImageView.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ]
        
        let subTitleLabelConstraints = [
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(authImageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(subTitleLabelConstraints)
    }
}
