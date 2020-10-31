//
//  HabitRepository.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/29/20.
//

import Foundation

protocol HabitRepository {
    @discardableResult
    func fetchHabits() -> Cancellable?
    @discardableResult
    func createHabit() -> Cancellable?
    @discardableResult
    func updateHabit() -> Cancellable?
    @discardableResult
    func deleteHabit() -> Cancellable?
}
