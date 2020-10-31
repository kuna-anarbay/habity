//
//  Habit.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/29/20.
//

import Foundation

struct Habit {
    var id: String
    var name: String
    var author: String
    var goal: Int = 1
    var shared: [String]
    var streak: Int
    var reminders: [Int]
    var repetitionType: String
    var repetitionContent: [Int]
}
