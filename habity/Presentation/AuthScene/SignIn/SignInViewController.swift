//
//  SignInViewController.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/29/20.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class SignInViewController: UIViewController {
    
    
    //MARK:- Properties
    var viewModel: SignInViewModel!
    private let disposeBag: DisposeBag = DisposeBag()
    
    
    //MARK:- IBOutlets
    private lazy var signInButton: UIButton = .customButton(title: .signIn,
                                                            tintColor: .white,
                                                            backgroundColor: .tintColor,
                                                            cornerRadius: 10.0,
                                                            textAlignment: .center,
                                                            action: .init(binder: viewModel.signIn,
                                                                          disposeBag: disposeBag))
    
    private lazy var forgotButton: UIButton = .textOnly(title: .forgotPassword,
                                                        tintColor: .tintColor,
                                                        textAlignment: .right,
                                                        font: .systemFont(ofSize: 17),
                                                        action: .init(binder: viewModel.forgotPassword,
                                                                      disposeBag: disposeBag))
    
    private lazy var signUpButton: UIBarButtonItem = .customButton(title: .signUp,
                                                                   style: .done,
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
    
    private lazy var logoImageView: UIImageView = .customImageView(image: nil,
                                                                   contentMode: .scaleAspectFit)
    
    private lazy var welcomeLabel: UILabel = .largeTitle(text: .welcome,
                                                         weight: .bold,
                                                         textAlignment: .center)
    
    private lazy var descriptionLabel: UILabel = .body(text: .signInDescription,
                                                       textAlignment: .center)
    
    private lazy var contentView: UIView = .init()
    
    
    //MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        updateConstraints()
        bindViewModel()
    }

    
    //MARK: Setup Views
    func setupViews() {
        
        self.navigationItem.rightBarButtonItem = signUpButton
        self.view.backgroundColor = .backgroundColor
        
        [logoImageView, welcomeLabel, descriptionLabel, emailTextField, passwordTextField, forgotButton].forEach(contentView.addSubview)
        [signInButton, contentView].forEach(self.view.addSubview)
    }
    
    func configure(viewModel: SignInViewModel) {
        self.viewModel = viewModel
    }
    
    
    //MARK: Update constaints
    func updateConstraints() {
        
        contentView.snp.updateConstraints {
            $0.top.equalToSuperview().offset(144)
            $0.left.equalToSuperview().offset(16.0)
            $0.right.equalToSuperview().offset(-16.0)
        }
        
        logoImageView.snp.updateConstraints {
            $0.height.equalTo(100)
            $0.width.equalTo(100)
            $0.centerX.equalTo(contentView)
            $0.top.equalTo(contentView.snp.top)
        }
        
        welcomeLabel.snp.updateConstraints {
            $0.top.equalTo(logoImageView).offset(32.0)
            $0.left.equalTo(contentView.snp.left)
            $0.right.equalTo(contentView.snp.right)
        }
        
        descriptionLabel.snp.updateConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(10.0)
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
        
        forgotButton.snp.updateConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20.0)
            $0.right.equalTo(contentView.snp.right)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
        
        signInButton.snp.updateConstraints {
            $0.height.equalTo(50)
            $0.left.equalToSuperview().offset(16.0)
            $0.bottom.equalToSuperview().offset(-32.0)
            $0.right.equalToSuperview().offset(-16.0)
        }
    }
    
    
    //MARK: Bind view model
    func bindViewModel() {
        viewModel.error.subscribe { [weak self] (error) in
            self?.showAlert(title: error)
        }.disposed(by: disposeBag)
    }
    
    
    func showAlert(title: String?) {
        let alert = UIAlertController(title: title, message: "Some error occurred", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .cancel))
        
        self.present(alert, animated: true)
    }
}

