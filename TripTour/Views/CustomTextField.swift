//
//  CustomTextField.swift
//  TripTour
//
//  Created by 권정근 on 6/20/24.
//

import UIKit

class CustomTextField: UITextField {
    
    enum CustomTextFieldType {
        case email
        case password
    }
    
    private let authFieldType: CustomTextFieldType
    
    init(fieldType: CustomTextFieldType) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 10
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        self.spellCheckingType = .no
    
        
        // 들여쓰기 설정
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        
        
        switch fieldType {
        case.email:
            self.placeholder = "Type your Email"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
        case .password:
            self.placeholder = "Type your Password"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
