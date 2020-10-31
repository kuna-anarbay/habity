//
//  ForgotPasswordViewModel.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/30/20.
//

import Foundation
import RxSwift
import RxCocoa

protocol ForgotPasswordViewModelActions {
    var showMailSent: Observable<String> { get }
}

protocol ForgotPasswordViewModelInput {
    var email: BehaviorRelay<String?> { get }
    
    var sendMail: BehaviorRelay<Void?> { get }
}

protocol ForgotPasswordViewModelOutput {
    var mailSent: PublishSubject<String> { get }
    var error: PublishSubject<String?> { get }
    var loading: PublishSubject<Bool> { get }
}


protocol ForgotPasswordViewModel: ViewModel, ForgotPasswordViewModelActions, ForgotPasswordViewModelInput, ForgotPasswordViewModelOutput {
}


final class DefaultForgotPasswordViewModel: ForgotPasswordViewModel {
    
    //MARK: Properties
    internal let disposeBag: DisposeBag = DisposeBag()
    private let forgotPasswordUseCase: ForgotPasswordUseCase
    
    //MARK: Parameters
    //Actions
    var showMailSent: Observable<String>
    
    //Input
    var email: BehaviorRelay<String?> = .init(value: nil)
    var sendMail: BehaviorRelay<Void?> = .init(value: nil)
    
    //Output
    var mailSent: PublishSubject<String> = .init()
    var error: PublishSubject<String?> = .init()
    var loading: PublishSubject<Bool> = .init()
    
    
    init(forgotPasswordUseCase: ForgotPasswordUseCase) {
        self.forgotPasswordUseCase = forgotPasswordUseCase
        
        self.showMailSent = mailSent.asObservable()
    }
    
    
    
    private func sendMail(email: String?) {
        guard let email = email else {
            error.onNext("Please enter email")
            return
        }
        guard email.isValidEmail else {
            error.onNext("Please enter correct email address")
            return
        }
    
        loading.onNext(true)
        forgotPasswordUseCase.start(input: .init(email: email,
                                                 languageCode: nil)) { [weak self] result in
            self?.loading.onNext(false)
            switch result {
            case .success:
                break
            case .failure(let error):
                self?.error.onNext(error.localizedDescription)
            }
        }
        
    }
    
}
