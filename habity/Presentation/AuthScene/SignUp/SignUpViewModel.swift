//
//  SignUpViewModel.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/31/20.
//

import Foundation
import RxCocoa
import RxSwift

protocol SignUpViewModelActions {
    
}

protocol SignUpViewModelInput {
    var email: BehaviorRelay<String?> { get }
    var password: BehaviorRelay<String?> { get }
    var confirmation: BehaviorRelay<String?> { get }
    
    var signUp: BehaviorRelay<Void?> { get }
}

protocol SignUpViewModelOutput {
    var verificationSent: PublishSubject<User?> { get }
    var error: PublishSubject<String?> { get }
    var loading: PublishSubject<Bool> { get }
}


protocol SignUpViewModel: ViewModel, SignUpViewModelActions, SignUpViewModelInput, SignUpViewModelOutput { }


final class DefaultSignUpViewModel: SignUpViewModel {
    
    //MARK: Properties
    internal let disposeBag: DisposeBag = DisposeBag()
    private let signUpUseCase: SignUpUseCase
    
    //MARK: Parameters
    //Input
    var email: BehaviorRelay<String?> = .init(value: nil)
    var password: BehaviorRelay<String?> = .init(value: nil)
    var confirmation: BehaviorRelay<String?> = .init(value: nil)
    var signUp: BehaviorRelay<Void?> = .init(value: nil)
    
    //Output
    var verificationSent: PublishSubject<User?> = .init()
    var error: PublishSubject<String?> = .init()
    var loading: PublishSubject<Bool> = .init()
    
    
    init(signUpUseCase: SignUpUseCase) {
        self.signUpUseCase = signUpUseCase
        
        self.signUp
            .compactMap { $0 }
            .subscribe { _ in
                self.signUp(email: self.email.value,
                            password: self.password.value,
                            confirmation: self.confirmation.value)
            }.disposed(by: disposeBag)
    }
    
    
    
    private func signUp(email: String?,
                        password: String?,
                        confirmation: String?) {
        loading.onNext(true)
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + 5) { [weak self] in
            DispatchQueue.main.async {
                self?.loading.onNext(false)
            }
        }
        guard let email = email, let password = password, let confirmation = confirmation else {
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
        guard password == confirmation else {
            error.onNext("Please confirm password")
            return
        }
        
        
//        signUpUseCase.start(input: .init(email: email,
//                                         password: password)) { [weak self] result in
//            self?.loading.onNext(false)
//            switch result {
//            case .success(let user):
//                self?.verificationSent.onNext(user)
//                break
//            case .failure(let error):
//                self?.error.onNext(error.localizedDescription)
//            }
//        }
        
    }
    
}
