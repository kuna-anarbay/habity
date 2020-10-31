//
//  UseCase.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/29/20.
//

import Foundation

protocol UseCase {
    associatedtype ResultValue
    associatedtype InputValue
    func start(input: InputValue, completion: @escaping (ResultValue) -> ())
}
