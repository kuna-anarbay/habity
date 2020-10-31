//
//  DefaultAuthRepository.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/29/20.
//

import Foundation

final class DefaultAuthRepository {
    
    let authService: AuthService
    
    init(authService: AuthService) {
        self.authService =  authService
    }
}

extension DefaultAuthRepository: AuthRepository {
    
    
    func signIn(email: String,
                password: String,
                completion: @escaping (Result<User?, Error>) -> ()) {
        authService.signIn(email: email,
                           password: password) { result in
            switch result {
            case .success(let user):
                completion(.success(user?.toDomain()))
            case .failure(let authError):
                completion(.failure(authError))
            }
        }
    }
    
    
    func forgotPassword(email: String,
                        languageCode: String? = nil,
                        completion: @escaping (Result<User?, Error>) -> ()) {
        authService.forgotPassword(email: email,
                                   languageCode: languageCode) { result in
            switch result {
            case .success:
                completion(.success(nil))
            case .failure(let authError):
                completion(.failure(authError))
            }
        }
    }
    
    
    func signUp(email: String, password: String, completion: @escaping (Result<User?, Error>) -> ()) {
        authService.signUp(email: email,
                           password: password) { result in
            switch result {
            case .success(let user):
                completion(.success(user?.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func reset(password: String, with newPassword: String, completion: @escaping (Result<User?, Error>) -> ()) {
        
    }
    
    
    
    
    
}
