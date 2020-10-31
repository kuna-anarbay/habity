//
//  SignInUseCase.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/29/20.
//

import Foundation

final class SignInUseCase: UseCase {
    
    // Input values
    struct InputValue {
        let email: String
        let password: String
    }
    
    // Result value
    typealias ResultValue = (Result<User?, Error>)
    
    // Properties
    private let authRepository: AuthRepository
    
    
    // Initializer
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    
    // Sign in user
    func start(input: InputValue, completion: @escaping (ResultValue) -> ()) {
        authRepository.signIn(email: input.email,
                              password: input.password,
                              completion: completion)
    }
    
}
