//
//  UITextField + CustomInit.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/29/20.
//

import UIKit
import RxSwift
import RxCocoa

extension UITextField {
    
    ///Creates UITextField with custom parameters
    static func customTextField(placeholder: String?,
                                cornerRadius: CGFloat = 10.0,
                                backgroundColor: UIColor? = .textFieldColor,
                                font: UIFont? = nil,
                                action: Action<String?>? = nil,
                                isSecureTextEntry: Bool = false,
                                keyboardType: UIKeyboardType = .default) -> UITextField {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.leftView = .init(frame: .init(origin: .zero, size: .init(width: 16.0,
                                                                           height: textField.bounds.height)))
        textField.leftViewMode = .always
        textField.rightView = .init(frame: .init(origin: .zero, size: .init(width: 16.0,
                                                                            height: textField.bounds.height)))
        textField.rightViewMode = .always
        textField.placeholder = placeholder
        textField.layer.cornerRadius = cornerRadius
        textField.backgroundColor = backgroundColor
        textField.font = font
        textField.isSecureTextEntry = isSecureTextEntry
        textField.keyboardType = keyboardType
        if let action = action {
            textField.rx.text.bind(to: action.binder).disposed(by: action.disposeBag)
        }
        
        return textField
        
    }
    
    
}
