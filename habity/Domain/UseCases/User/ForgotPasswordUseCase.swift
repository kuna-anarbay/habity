//
//  ForgotPasswordUseCase.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/30/20.
//

import Foundation

final class ForgotPasswordUseCase: UseCase {
    
    // Input values
    struct InputValue {
        let email: String
        let languageCode: String?
    }
    
    // Result value
    typealias ResultValue = (Result<User?, Error>)
    
    // Properties
    private let authRepository: AuthRepository
    
    
    // Initializer
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    
    // Send reset link
    func start(input: InputValue, completion: @escaping (ResultValue) -> ()) {
        authRepository.forgotPassword(email: input.email,
                                      languageCode: input.languageCode,
                                      completion: completion)
    }
    
}
