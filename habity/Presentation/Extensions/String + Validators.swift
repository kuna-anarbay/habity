//
//  String + Validators.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/30/20.
//

import Foundation


extension String {
    
    /**
        Checks email for correctness
        - At least on character before @
        - At least one character after @
        - At least 2 alpha characters after dot
     */
    public var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    
    /**
        Checks password for correctness
        - One uppercase letter at least
        - One digit  at least
        - One lowercase letter at least
        - 8 characters at least
     */
    public var isValidPassword: Bool {
        let passwordRegEx = "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}"
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: self)
    }
}
