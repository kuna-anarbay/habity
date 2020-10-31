//
//  Coordinator.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/29/20.
//

import UIKit
import RxSwift

public protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    var disposeBag: DisposeBag { get }
    
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
