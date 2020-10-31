//
//  User.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/29/20.
//

import Foundation

struct User {
    var id: String
    var email: String?
    var imageUrl: String?
    var isVerified: Bool
    var name: String?
    var friends: [String]
    var overallProgress: Double?
    var todayProgress: Double?
}
