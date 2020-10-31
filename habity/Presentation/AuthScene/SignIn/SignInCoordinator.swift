//
//  SignInCoordinator.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/29/20.
//

import UIKit
import RxSwift
import RxCocoa

struct SignInCoordinatorDependencies  {
    var makeSignInViewController: () -> SignInViewController
    var makeForgotPasswordCoordinator: (UINavigationController?) -> ForgotPasswordCoordinator
    var makeSignUpCoordinator: (UINavigationController?) -> SignUpCoordinator
}

final class SignInCoordinator: Coordinator {
    
    weak var navigationController: UINavigationController?
    private let dependencies: SignInCoordinatorDependencies
    internal let disposeBag = DisposeBag()
    
    
    init(navigationController: UINavigationController?,
         dependencies: SignInCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let viewController = dependencies.makeSignInViewController()
        
        viewController.viewModel.showForgotPassword
            .compactMap { $0 }
            .subscribe(onNext: { pressed in
                self.showForgotPassword()
            }).disposed(by: disposeBag)
        
        viewController.viewModel.showSignedIn
            .compactMap { $0 }
            .subscribe { _ in
                self.showSignedIn()
            }.disposed(by: disposeBag)
        
        viewController.viewModel.showSignUp
            .compactMap { $0 }
            .subscribe { _ in
                self.showSignUp()
            }.disposed(by: disposeBag)
        
        navigationController?.transparentNavigation()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showForgotPassword() {
        let forgotPasswordCoordinator = dependencies.makeForgotPasswordCoordinator(self.navigationController)
        coordinate(to: forgotPasswordCoordinator)
    }
    
    
    func showSignedIn() {
        
    }
    
    
    func showSignUp() {
        let signUpCoordinator = dependencies.makeSignUpCoordinator(self.navigationController)
        coordinate(to: signUpCoordinator)
    }
}
