//
//  AuthManager.swift
//  TripTour
//
//  Created by 권정근 on 6/18/24.
//

import Foundation


final class AuthManager {
    
    static let shared = AuthManager()
    
    private init() { }
    
    var isSignedIn: Bool {
        return false
    }
}
