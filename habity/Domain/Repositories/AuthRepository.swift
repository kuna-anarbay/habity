//
//  AuthRepository.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/29/20.
//

import Foundation

protocol AuthRepository {
    func signIn(email: String,
                password: String,
                completion: @escaping (Result<User?, Error>) -> ())
    func signUp(email: String,
                password: String,
                completion: @escaping (Result<User?, Error>) -> ())
    func reset(password: String,
               with newPassword: String,
               completion: @escaping (Result<User?, Error>) -> ())
    func forgotPassword(email: String,
                        languageCode: String?,
                        completion: @escaping (Result<User?, Error>) -> ())
}
