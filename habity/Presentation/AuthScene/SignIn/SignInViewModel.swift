//
//  SignInViewModel.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/29/20.
//

import Foundation
import RxSwift
import RxCocoa

protocol SignInViewModelActions {
    var showForgotPassword: Observable<Void?> { get }
    var showSignedIn: Observable<User> { get }
    var showSignUp: Observable<Void?> { get }
}

protocol SignInViewModelInput {
    var email: BehaviorRelay<String?> { get }
    var password: BehaviorRelay<String?> { get }
    
    var signIn: BehaviorRelay<Void?> { get }
    var forgotPassword: BehaviorRelay<Void?> { get }
    var signUp: BehaviorRelay<Void?> { get }
}

protocol SignInViewModelOutput {
    var signedIn: PublishSubject<User> { get }
    var error: PublishSubject<String?> { get }
    var loading: PublishSubject<Bool> { get }
}

protocol SignInViewModel: ViewModel, SignInViewModelActions, SignInViewModelInput, SignInViewModelOutput { }


final class DefaultSignInViewModel: SignInViewModel {
    
    //MARK: Properties
    internal let disposeBag = DisposeBag()
    private let signInUseCase: SignInUseCase
    
    
    //MARK: Parameters
    //Actions
    var showForgotPassword: Observable<Void?>
    var showSignedIn: Observable<User>
    var showSignUp: Observable<Void?>
    
    //Input
    var email: BehaviorRelay<String?> = .init(value: nil)
    var password: BehaviorRelay<String?> = .init(value: nil)
    var signIn: BehaviorRelay<Void?> = .init(value: nil)
    var forgotPassword: BehaviorRelay<Void?> = .init(value: nil)
    var signUp: BehaviorRelay<Void?> = .init(value: nil)
    
    //Output
    var signedIn: PublishSubject<User> = .init()
    var error: PublishSubject<String?> = .init()
    var loading: PublishSubject<Bool> = .init()
    
    
    //MARK: Initializer
    init(signInUseCase: SignInUseCase) {
        self.signInUseCase = signInUseCase
        
        self.showForgotPassword = forgotPassword.asObservable()
        self.showSignedIn = signedIn.asObservable()
        self.showSignUp = signUp.asObservable()
        
        self.signIn
            .compactMap { $0 }
            .subscribe { _ in
            self.signIn(email: self.email.value, password: self.password.value)
        }.disposed(by: disposeBag)
    }
    
    
    
    private func signIn(email: String?,
                        password: String?) {
        guard let email = email, let password = password else {
            error.onNext("Please enter email and password")
            return
        }
        guard email.isValidEmail else {
            error.onNext("Please enter correct email address")
            return
        }
        guard password.isValidPassword else {
            error.onNext("Please enter correct password address")
            return
        }
        
        loading.onNext(true)
        signInUseCase.start(input: .init(email: email,
                                         password: password)) { [weak self] result in
            self?.loading.onNext(false)
            switch result {
            case .failure(let error):
                self?.error.onNext(error.localizedDescription)
            case .success(let user):
                guard let user = user else {
                    self?.error.onNext("User not found")
                    return
                }
                self?.signedIn.onNext(user)
                break
            }
        }
    }
    
    
}
