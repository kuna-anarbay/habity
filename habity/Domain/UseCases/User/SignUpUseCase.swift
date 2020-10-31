//
//  SignUpUseCase.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/29/20.
//

import Foundation

final class SignUpUseCase: UseCase {
    
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
    
    
    // Sign up user
    func start(input: InputValue, completion: @escaping (ResultValue) -> ()) {
        authRepository.signUp(email: input.email,
                              password: input.password,
                              completion: completion)
    }
    
}
