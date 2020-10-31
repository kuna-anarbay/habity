//
//  AuthSceneDIContainer.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/29/20.
//

import UIKit

final class AuthSceneDIContainer {
    
    let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    //MARK:- Repositories
    func makeAuthRepository() -> AuthRepository {
        return DefaultAuthRepository(authService: self.authService)
    }
    
    
    //MARK:- UseCases
    func makeSignInUseCase() -> SignInUseCase {
        return SignInUseCase(authRepository: self.makeAuthRepository())
    }
    
    func makeForgotPasswordUseCase() -> ForgotPasswordUseCase {
        return ForgotPasswordUseCase(authRepository: self.makeAuthRepository())
    }
    
    func makeSignUpUseCase() -> SignUpUseCase {
        return SignUpUseCase(authRepository: self.makeAuthRepository())
    }
    
    
    //MARK:- Coordinator
    func makeSignInCoordinator(navigationController: UINavigationController?) -> SignInCoordinator {
        return SignInCoordinator(navigationController: navigationController,
                                 dependencies: .init(makeSignInViewController: makeSignInViewController,
                                                     makeForgotPasswordCoordinator: makeForgotPasswordCoordinator,
                                                     makeSignUpCoordinator: makeSignUpCoordinator))
    }
    
    func makeForgotPasswordCoordinator(navigationController: UINavigationController?) -> ForgotPasswordCoordinator {
        return ForgotPasswordCoordinator(navigationController: navigationController,
                                         dependencies: .init(makeForgotPasswordController: self.makeForgotPasswordViewController))
    }
    
    func makeSignUpCoordinator(navigationController: UINavigationController?) -> SignUpCoordinator {
        return SignUpCoordinator(navigationController: navigationController,
                                 dependencies: .init(makeSignUpViewController: makeSignUpViewController))
    }
    
    
    //MARK:- ViewController
    func makeSignInViewController() -> SignInViewController {
        let signInViewController = SignInViewController()
        signInViewController.configure(viewModel: makeSignInViewModel())
        
        return signInViewController
    }
    
    func makeForgotPasswordViewController() -> ForgotPasswordViewController {
        let signInViewController = ForgotPasswordViewController()
        signInViewController.configure(viewModel: self.makeForgotPasswordViewModel())
        
        return signInViewController
    }
    
    func makeSignUpViewController() -> SignUpViewController {
        let signUpViewController = SignUpViewController()
        signUpViewController.configure(viewModel: self.makeSignUpViewModel())
        
        return signUpViewController
    }
    
    //MARK:- ViewModel
    func makeSignInViewModel() -> SignInViewModel {
        return DefaultSignInViewModel(signInUseCase: self.makeSignInUseCase())
    }
    
    func makeForgotPasswordViewModel() -> ForgotPasswordViewModel {
        return DefaultForgotPasswordViewModel(forgotPasswordUseCase: self.makeForgotPasswordUseCase())
    }
    
    func makeSignUpViewModel() -> SignUpViewModel {
        return DefaultSignUpViewModel(signUpUseCase: self.makeSignUpUseCase())
    }
    
}
