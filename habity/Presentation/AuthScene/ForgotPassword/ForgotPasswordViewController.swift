//
//  ForgotPasswordViewController.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/30/20.
//

import UIKit
import RxSwift
import RxCocoa

final class ForgotPasswordViewController: UIViewController {
    
    
    //MARK:- Properties
    var viewModel: ForgotPasswordViewModel!
    private let disposeBag: DisposeBag = DisposeBag()
    
    
    //MARK:- IBOutlets
    private lazy var sendMailButton: UIButton = .customButton(title: .sendResetLink,
                                                              tintColor: .white,
                                                              backgroundColor: .tintColor,
                                                              cornerRadius: 10.0,
                                                              textAlignment: .center,
                                                              action: .init(binder: viewModel.sendMail,
                                                                            disposeBag: disposeBag))
    
    private lazy var emailTextField: UITextField = .customTextField(placeholder: .email,
                                                                    font: .systemFont(ofSize: 20),
                                                                    action: .init(binder: viewModel.email,
                                                                                  disposeBag: disposeBag),
                                                                    keyboardType: .emailAddress)
    
    private lazy var titleLabel: UILabel = .largeTitle(text: .forgotPassword,
                                                       weight: .bold,
                                                       textAlignment: .center)
    
    private lazy var descriptionLabel: UILabel = .body(text: .forgotPasswordDescription,
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
        self.view.backgroundColor = .backgroundColor
        
        [titleLabel, descriptionLabel, emailTextField].forEach(contentView.addSubview)
        [sendMailButton, contentView].forEach(self.view.addSubview)
    }
    
    func configure(viewModel: ForgotPasswordViewModel) {
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
            $0.bottom.equalTo(contentView.snp.bottom)
            $0.right.equalTo(contentView.snp.right)
        }
        
        sendMailButton.snp.updateConstraints {
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
