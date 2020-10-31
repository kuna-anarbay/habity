//
//  UIControl+RxCocoa.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/30/20.
//

import UIKit
import RxSwift
import RxCocoa

extension UIControl {
    
    struct Action<T> {
        var binder: BehaviorRelay<T>
        var disposeBag: DisposeBag
    }
}
