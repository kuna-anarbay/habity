//
//  SignUpViewController.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/31/20.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class SignUpViewController: UIViewController {
    
    
    //MARK:- Properties
    var viewModel: SignUpViewModel!
    private let disposeBag: DisposeBag = DisposeBag()
    
    
    //MARK:- IBOutlets
    private lazy var signUpButton: UIButton = .customButton(title: .signUp,
                                                            tintColor: .white,
                                                            backgroundColor: .tintColor,
                                                            cornerRadius: 10.0,
                                                            textAlignment: .center,
                                                            action: .init(binder: viewModel.signUp,
                                                                          disposeBag: disposeBag))
    
    private lazy var emailTextField: UITextField = .customTextField(placeholder: .email,
                                                                    font: .systemFont(ofSize: 20),
                                                                    action: .init(binder: viewModel.email,
                                                                                  disposeBag: disposeBag),
                                                                    keyboardType: .emailAddress)
    
    private lazy var passwordTextField: UITextField = .customTextField(placeholder: .password,
                                                                       font: .systemFont(ofSize: 20),
                                                                       action: .init(binder: viewModel.password,
                                                                                     disposeBag: disposeBag),
                                                                       isSecureTextEntry: true)
    
    private lazy var confirmationTextField: UITextField = .customTextField(placeholder: .confirmPassword,
                                                                           font: .systemFont(ofSize: 20),
                                                                           action: .init(binder: viewModel.confirmation,
                                                                                     disposeBag: disposeBag),
                                                                           isSecureTextEntry: true)
    
    private lazy var titleLabel: UILabel = .largeTitle(text: .signUpTitle,
                                                       weight: .bold,
                                                       textAlignment: .center)
    
    private lazy var descriptionLabel: UILabel = .body(text: .signUpDescription,
                                                       textAlignment: .center)
    
    private lazy var contentView: UIView = .init()
    
    private lazy var alertViewController: AlertViewController = .customInit(text: "Singing in",
                                                                            message: "Pretty cool! 👍 But the question is — why go through the trouble of implementing a view controller for something like a loading spinner")
    
    //MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        updateConstraints()
        bindViewModel()
    }

    
    //MARK: Setup Views
    func setupViews() {
        self.view.backgroundColor = .backgroundColor
        
        [titleLabel, descriptionLabel, emailTextField, passwordTextField, confirmationTextField].forEach(contentView.addSubview)
        [signUpButton, contentView].forEach(self.view.addSubview)
    }
    
    func configure(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
    }
    
    
    //MARK: Update constaints
    func updateConstraints() {
        
        contentView.snp.updateConstraints {
            $0.top.equalToSuperview().offset(144)
            $0.left.equalToSuperview().offset(16.0)
            $0.right.equalToSuperview().offset(-16.0)
        }
        
        titleLabel.snp.updateConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.left.equalTo(contentView.snp.left)
            $0.right.equalTo(contentView.snp.right)
        }
        
        descriptionLabel.snp.updateConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10.0)
            $0.left.equalTo(contentView.snp.left)
            $0.right.equalTo(contentView.snp.right)
        }
        
        emailTextField.snp.updateConstraints {
            $0.height.equalTo(46)
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(32.0)
            $0.left.equalTo(contentView.snp.left)
            $0.right.equalTo(contentView.snp.right)
        }
        
        passwordTextField.snp.updateConstraints {
            $0.height.equalTo(46)
            $0.top.equalTo(emailTextField.snp.bottom).offset(8.0)
            $0.left.equalTo(contentView.snp.left)
            $0.right.equalTo(contentView.snp.right)
        }
        
        confirmationTextField.snp.updateConstraints {
            $0.height.equalTo(46)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(8.0)
            $0.left.equalTo(contentView.snp.left)
            $0.right.equalTo(contentView.snp.right)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
        
        signUpButton.snp.updateConstraints {
            $0.height.equalTo(50)
            $0.left.equalToSuperview().offset(16.0)
            $0.bottom.equalToSuperview().offset(-32.0)
            $0.right.equalToSuperview().offset(-16.0)
        }
    }
    
    
    //MARK: Bind view model
    func bindViewModel() {
        viewModel.loading
            .compactMap { $0 }
            .subscribe { [weak self] loading in
                guard let self = self, let loading = loading.element else { return }
                print(loading)
                if loading {
                    self.add(childViewController: self.alertViewController)
                } else {
                    self.alertViewController.remove()
                }
            }.disposed(by: disposeBag)
    }
}

