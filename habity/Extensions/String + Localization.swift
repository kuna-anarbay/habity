//
//  String + Localization.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/29/20.
//

import Foundation


/*
    Only translations are acceptable
 */
extension String {
    
    //SignInScene
    static let signIn = NSLocalizedString("Sign In", comment: "")
    static let email = NSLocalizedString("Email", comment: "")
    static let password = NSLocalizedString("Password", comment: "")
    static let forgotPassword = NSLocalizedString("Forgot password", comment: "")
    static let welcome = NSLocalizedString("Welcome", comment: "")
    static let signInDescription = NSLocalizedString("Sign in using email and password", comment: "")
    
    //ForgotPasswordScene
    static let forgotPasswordDescription = NSLocalizedString("Enter your mail and we will send you reset link", comment: "")
    static let sendResetLink = NSLocalizedString("Send reset link", comment: "")
    
    
    //SignUpScene
    static let signUp = NSLocalizedString("Sign Up", comment: "")
    static let signUpTitle = NSLocalizedString("Join us", comment: "")
    static let signUpDescription = NSLocalizedString("Sign up using email and password", comment: "")
    static let confirmPassword = NSLocalizedString("Confirm password", comment: "")
}

