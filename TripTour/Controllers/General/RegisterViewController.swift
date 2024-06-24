//
//  RegisterViewController.swift
//  TripTour
//
//  Created by 권정근 on 6/20/24.
//

import UIKit
import Combine


class RegisterViewController: UIViewController {
    
    // MARK: - Variable
    private var viewModel = RegisterViewViewModel()
    private var subscriptions: Set<AnyCancellable> = []
    
    
    // MARK: - UI Components
    private let headerView: AuthHeaderView = {
        let headerView = AuthHeaderView(title: "Sign Up", subTitle: "Create your account")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    private let useremailTextField: CustomTextField = {
        let textField = CustomTextField(fieldType: .email)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField: CustomTextField = {
        let textField = CustomTextField(fieldType: .password)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let createAccountButton: CustomButton = {
        let button = CustomButton(title: "Create Account", hasBackground: true, fontSize: .big)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        
        return button
    }()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBrown
        view.addSubview(headerView)
        view.addSubview(useremailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(createAccountButton)
        
        view.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(didTapToDismiss)))
        
        createAccountButton.addTarget(self, action: #selector(didTapRegisterUser), for: .touchUpInside)
        
        bindViews()
        
        configureConstraints()
    }
    
    
    
    // MARK: - Functions
    private func bindViews() {
        useremailTextField.addTarget(self, action: #selector(didChangeEmailField), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(didChangePasswordField), for: .editingChanged)
        
        // email과 password를 정규식으로 판단한 값을 갖고 온다.
        // 해당 값 (Boolean 타입)을 createAccountButton에 할당
        viewModel.$isRegistrationFormValid.sink { [weak self] validateState in
            self?.createAccountButton.isEnabled = validateState
            self?.createAccountButton.backgroundColor = (self?.createAccountButton.isEnabled)! ? .systemIndigo : .systemRed
            print(validateState)
        }
        .store(in: &subscriptions)
        
        viewModel.$user.sink { [weak self] user in
            guard user != nil else { return }
            guard let vc = self?.navigationController?.viewControllers.first as? RegisterViewController else { return }
            vc.dismiss(animated: true)
        }
        .store(in: &subscriptions)
    }
    
    @objc private func didChangeEmailField() {
        viewModel.email = useremailTextField.text
        viewModel.validateRegistrationForm()
    }
    
    @objc private func didChangePasswordField() {
        viewModel.password = passwordTextField.text
        viewModel.validateRegistrationForm()
    }
    
    // 빈화면 누르면 키보드가 내려가는 함수
    @objc private func didTapToDismiss() {
        view.endEditing(true)
    }
    
    @objc private func didTapRegisterUser() {
        viewModel.createUser()
    }
    
    
    // MARK: - UI Constraints
    private func configureConstraints() {
        
        let headerViewConstraints = [
            headerView.topAnchor.constraint(equalTo: view.topAnchor,constant: 10),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 300)
        ]
        
        let useremailTextFieldConstraints = [
            useremailTextField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 50),
            useremailTextField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            useremailTextField.heightAnchor.constraint(equalToConstant: 55),
            useremailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
            
        ]
        
        let passwordTextFieldConstraints = [
            passwordTextField.topAnchor.constraint(equalTo: useremailTextField.bottomAnchor, constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 55),
            passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
        ]
        
        let createAccountButtonConstraints = [
            createAccountButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            createAccountButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            createAccountButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            createAccountButton.heightAnchor.constraint(equalToConstant: 55)
        ]
        
        NSLayoutConstraint.activate(headerViewConstraints)
        NSLayoutConstraint.activate(useremailTextFieldConstraints)
        NSLayoutConstraint.activate(passwordTextFieldConstraints)
        NSLayoutConstraint.activate(createAccountButtonConstraints)
    }
}
