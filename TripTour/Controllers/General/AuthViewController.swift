//
//  AuthViewController.swift
//  TripTour
//
//  Created by 권정근 on 6/19/24.
//

import UIKit

class AuthViewController: UIViewController {
    
    
    // MARK: - UI Components
    private let headerView: AuthHeaderView = {
        let headerView = AuthHeaderView(title: "Sign In", subTitle: "Sign in to your account")
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
    
    private let loginButton: CustomButton = {
        let button = CustomButton(title: "Login", hasBackground: true, fontSize: .big)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let newUserButton: CustomButton = {
        let button = CustomButton(title: "New User? Create Account", hasBackground: false, fontSize: .med)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let forgotPasswordButton: CustomButton = {
        let button = CustomButton(title: "Forgot Password?", hasBackground: false, fontSize: .med)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "kakao_login_medium_narrow.png"), for: .normal)
        return button
    }()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBrown
        view.addSubview(headerView)
        view.addSubview(useremailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(newUserButton)
        view.addSubview(forgotPasswordButton)
        view.addSubview(kakaoLoginButton)
        
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        newUserButton.addTarget(self, action: #selector(didTapNewUser), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        
        configureConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Functions
    @objc private func didTapLogin() {
        print("didTapLogin() called")
        let HomeVC = HomeViewController()
        self.present(HomeVC, animated: true)
    }
    
    @objc private func didTapNewUser() {
        print("didTapNewUser() called")
        
        let registerVC = RegisterViewController()
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    @objc private func didTapForgotPassword() {
        print("didTapForgotPassword() called")
        
        let forgotPasswordVC = ForgotPasswordViewController()
        self.navigationController?.pushViewController(forgotPasswordVC, animated: true)
    }
    
    // 빈화면 누르면 키보드 자동으로 내려가기 설정
    //    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        view.endEditing(true)
    //    }
    
    
    // MARK: - UI Constraints
    private func configureConstraints() {
        
        let headerViewConstraints = [
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 300)
        ]
        
        let useremailTextFieldConstraints = [
            useremailTextField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            useremailTextField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            useremailTextField.heightAnchor.constraint(equalToConstant: 55),
            useremailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
        ]
        
        let passwordTextFieldConstraints = [
            passwordTextField.topAnchor.constraint(equalTo: useremailTextField.bottomAnchor, constant: 10),
            passwordTextField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 55),
            passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
        ]
        
        let loginButtonConstraints = [
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 55)
        ]
        
        let newUserButtonConstraints = [
            newUserButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 5),
            newUserButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor)
        ]
        
        let forgotPasswordButtonConstraints = [
            forgotPasswordButton.topAnchor.constraint(equalTo: newUserButton.bottomAnchor, constant: 5),
            forgotPasswordButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor)
        ]
        
        let kakaoLoginButtonConstraints = [
            kakaoLoginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 10),
            kakaoLoginButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(headerViewConstraints)
        NSLayoutConstraint.activate(useremailTextFieldConstraints)
        NSLayoutConstraint.activate(passwordTextFieldConstraints)
        NSLayoutConstraint.activate(loginButtonConstraints)
        NSLayoutConstraint.activate(newUserButtonConstraints)
        NSLayoutConstraint.activate(forgotPasswordButtonConstraints)
        NSLayoutConstraint.activate(kakaoLoginButtonConstraints)
    }
}

