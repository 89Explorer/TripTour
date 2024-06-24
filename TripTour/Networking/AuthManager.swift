//
//  AuthManager.swift
//  TripTour
//
//  Created by 권정근 on 6/18/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreCombineSwift
import Combine

final class AuthManager {
    
    static let shared = AuthManager()
    
    private init() { }
    
    var error: Error?
    
//    func registerUser(with email: String, password: String) -> AnyPublisher<User, Error> {
//        return Auth.auth().createUser(withEmail: email, password: password)
//            .map(\.user)
//            .eraseToAnyPublisher()
//    }
    
    func registerUser(with email: String, password: String) -> AnyPublisher<User, Error> {
        return Future<User, Error> { promise in
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    promise(.failure(error))
                } else if let user = authResult?.user {
                    promise(.success(user))
                } else {
                    // Handle unexpected case where both authResult and error are nil
                    let unknownError = NSError(domain: "UnknownError", code: -1, userInfo: nil)
                    promise(.failure(unknownError))
                }
            }
        }
        .flatMap { user in
            Just(user).setFailureType(to: Error.self).eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
    

    
    
    /// A method to register the user
    /// - Parameters:
    ///   - userRequest: The users information (email, password, username)
    ///   - completion: A completion with two values ...
    ///        - Bool: was Registered - Determines if the user was registered and saved in the database correctly
    ///        - Error?: An optional error if firebase provides once
//    func registerUser(with userRequest: RegisterUserRequest, completion: @escaping (Bool, Error?) -> Void) {
//        let username = userRequest.username
//        let email = userRequest.email
//        let password = userRequest.password
//        
//        Auth.auth().createUser(withEmail: email, password: password) { result, error in
//            if let error = error {
//                completion(false, error)
//                return
//            }
//            
//            guard let resultUser = result?.user else {
//                completion(false, error)
//                return
//            }
//            let db = Firestore.firestore()
//            
//            db.collection("users")
//                .document(resultUser.uid)
//                .setData([
//                    "username": username,
//                    "email": email
//                ]) { error in
//                    if let error = error {
//                        completion(false, error)
//                        return
//                    }
//                    
//                    completion(true, nil)
//                }
//        }
//    }
    
    
//    func signIn(wit userRequest: LoginUserRequest, completion: @escaping (Error?) -> Void) {
//        Auth.auth().signIn(withEmail: userRequest.email, password: userRequest.password) { result, error in
//            if let error = error {
//                completion(error)
//                return
//            } else {
//                completion(nil)
//            }
//        }
//    }
    
    
//    func signOut(completion: @escaping (Error?) -> Void) {
//        do {
//            try Auth.auth().signOut()
//            completion(nil)
//        } catch let error {
//            completion(error)
//        }
//    }
}
