//
//  ForgotPasswordCoordinator.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/30/20.
//

import UIKit
import RxSwift
import RxCocoa

struct ForgotPasswordCoordinatorDependencies  {
    var makeForgotPasswordController: () -> ForgotPasswordViewController
}

final class ForgotPasswordCoordinator: Coordinator {
    
    weak var navigationController: UINavigationController?
    private let dependencies: ForgotPasswordCoordinatorDependencies
    internal let disposeBag = DisposeBag()
    
    
    init(navigationController: UINavigationController?,
         dependencies: ForgotPasswordCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    
    func start() {
        let viewController = dependencies.makeForgotPasswordController()
        
        viewController.viewModel.showMailSent
            .compactMap { $0 }
            .subscribe(onNext: { [unowned self] _ in
                self.mailSent()
            }).disposed(by: disposeBag)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func mailSent() {
        self.navigationController?.popViewController(animated: true)
    }
}
