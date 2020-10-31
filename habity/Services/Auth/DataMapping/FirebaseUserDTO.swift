//
//  FirebaseUserDTO.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/29/20.
//

import Foundation
import FirebaseAuth

extension FirebaseAuth.User {
    
    /**
        Converts Firebase.User to Domain.User
     */
    func toDomain() -> User {
        return User(id: self.uid,
                    email: self.email,
                    imageUrl: self.photoURL?.absoluteString,
                    isVerified: self.isEmailVerified,
                    name: self.displayName,
                    friends: [],
                    overallProgress: nil,
                    todayProgress: nil)
    }
}
