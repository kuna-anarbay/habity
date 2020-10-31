//
//  ViewModel.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/30/20.
//

import Foundation
import RxSwift

protocol ViewModel {
    var disposeBag: DisposeBag { get }
}
