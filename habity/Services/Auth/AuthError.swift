//
//  AuthError.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/29/20.
//

import Foundation

public enum AuthError: Error {
    case generic(Error)
    case userNotFound
    case alreadyExist
    case wrongCredentials
}
