//
//  RegisterViewViewModel.swift
//  TripTour
//
//  Created by 권정근 on 6/21/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import Combine


final class RegisterViewViewModel: ObservableObject {
    
    @Published var email: String?
    @Published var password: String?
    @Published var isRegistrationFormValid: Bool = false
    @Published var user: User?
    
    private var subscriptions: Set<AnyCancellable> = []
    
    // 이메일과 비밀번호 정규식으로 유효성 확인 함수
    func validateRegistrationForm() {
        guard let email = email,
              let password = password else {
            isRegistrationFormValid = false
            return
        }
       isRegistrationFormValid = isValidEmail(for: email) && isValidPassword(for: password)
    }
    
    
    /// A method to check the email address
    /// - Parameter email: The user Email Information
    /// - Returns: wasRighted - Determines if the email address was righted
    func isValidEmail(for email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
    /// A method to check the user name
    /// - Parameter username: The user name information
    /// - Returns: wasRighted - Determaines if the user name was righted
    func isValidUsername(for username: String) -> Bool {
        let username = username.trimmingCharacters(in: .whitespacesAndNewlines)
        let usernameRegEx = "\\w{4,24}"
        let usernamePred = NSPredicate(format:"SELF MATCHES %@", usernameRegEx)
        return usernamePred.evaluate(with: username)
    }
    
    
    
    ///  A method to check the password
    /// - Parameter password: The user password information
    /// - Returns: wasRighted - Determines if the password was righted
    func isValidPassword(for password: String) -> Bool {
        let password = password.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // 비밀번호 정규식
        // 대, 소문자 및 숫자, 특수기호 포함 및 8자리 이상 32자리 이하
        let passwordRegEx = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,32}$"
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }
    
    func createUser() {
        guard let email = email,
              let password = password else { return }
        
        AuthManager.shared.registerUser(with: email, password: password)
            .sink { _ in
                
            } receiveValue: { [weak self] user in
                self?.user = user
            }
            .store(in: &subscriptions)

    }
}
