//
//  SignUpViewCoordinator.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/31/20.
//

import UIKit
import RxSwift
import RxCocoa

struct SignUpCoordinatorDependencies  {
    var makeSignUpViewController: () -> SignUpViewController
}

final class SignUpCoordinator: Coordinator {
    
    weak var navigationController: UINavigationController?
    private let dependencies: SignUpCoordinatorDependencies
    internal let disposeBag = DisposeBag()
    
    
    init(navigationController: UINavigationController?,
         dependencies: SignUpCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    
    func start() {
        let viewController = dependencies.makeSignUpViewController()
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
