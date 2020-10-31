//
//  AuthService.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/29/20.
//

import Foundation
import FirebaseAuth


//MARK:- Auth service protocol
// List of the methods that auth service does
protocol AuthService {
    typealias CompletionHandler = (Result<FirebaseAuth.User?, AuthError>) -> ()
    
    func signIn(email: String,
                password: String,
                completion: @escaping CompletionHandler)
    func signUp(email: String,
                password: String,
                completion: @escaping CompletionHandler)
    func forgotPassword(email: String,
                        languageCode: String?,
                        completion: @escaping CompletionHandler)
    func updatePassword(password: String,
                        completion: @escaping CompletionHandler)
    func updateProfile(name: String?,
                        photoUrl: URL?,
                        completion: @escaping CompletionHandler)
    func deleteAccount(completion: @escaping CompletionHandler)
    func logOut(completion: @escaping CompletionHandler)
    
}


//MARK:- Auth service implementation
final class DefaultAuthService: AuthService {
    
    /**
        Sign in user with email and password
        - note: Function doesn't check email and password for properness
     */
    func signIn(email: String,
                password: String,
                completion: @escaping CompletionHandler) {
        Auth.auth().signIn(withEmail: email,
                           password: password) { (result, error) in
            if let error = error {
                completion(.failure(.generic(error)))
                return
            }
            
            completion(.success(result?.user))
        }
    }
    
    /**
        Sign up user with email and password
        - note: Function doesn't check email and password for properness
     */
    func signUp(email: String,
                password: String,
                completion: @escaping CompletionHandler) {
        Auth.auth().createUser(withEmail: email,
                               password: password) { (result, error) in
            if let error = error {
                completion(.failure(.generic(error)))
                return
            }
            
            guard let user = result?.user else {
                completion(.failure(.userNotFound))
                return
            }
            
            user.sendEmailVerification { (error) in
                if let error = error {
                    completion(.failure(.generic(error)))
                    return
                }
                completion(.success(result?.user))
            }
        }
    }
    
    /**
        Sends reset password link to the mail
        - note: Resettting password will be from the user's browser
     */
    func forgotPassword(email: String,
                        languageCode: String?,
                        completion: @escaping CompletionHandler) {
        Auth.auth().languageCode = languageCode
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                completion(.failure(.generic(error)))
                return
            }
            
            completion(.success(nil))
        }
    }
    
    /**
        Update current user's password
     */
    func updatePassword(password: String,
                        completion: @escaping CompletionHandler) {
        guard let currentUser = Auth.auth().currentUser else {
            completion(.failure(.userNotFound))
            return
        }
        currentUser.updatePassword(to: password) { (error) in
            if let error = error {
                completion(.failure(.generic(error)))
                return
            }
            
            completion(.success(nil))
        }
    }
    
    /**
        Update current user's name and profile url
     */
    func updateProfile(name: String?,
                       photoUrl: URL?,
                       completion: @escaping CompletionHandler) {
        guard let currentUser = Auth.auth().currentUser else {
            completion(.failure(.userNotFound))
            return
        }
        
        let updateRequest = currentUser.createProfileChangeRequest()
        updateRequest.displayName = name
        updateRequest.photoURL = photoUrl
        
        updateRequest.commitChanges { (error) in
            if let error = error {
                completion(.failure(.generic(error)))
                return
            }
            
            completion(.success(nil))
        }
    }
    
    
    /**
        Delete current user's account
     */
    func deleteAccount(completion: @escaping CompletionHandler) {
        guard let currentUser = Auth.auth().currentUser else {
            completion(.failure(.userNotFound))
            return
        }
        currentUser.delete { (error) in
            if let error = error {
                completion(.failure(.generic(error)))
                return
            }
            
            completion(.success(nil))
        }
    }
    
    /**
        Log out current user
     */
    func logOut(completion: @escaping CompletionHandler) {
        do {
            try Auth.auth().signOut()
            completion(.success(nil))
        } catch {
            completion(.failure(.generic(error)))
        }
    }
}
