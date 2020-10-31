//
//  UIButton + CustomInit.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/29/20.
//

import UIKit
import RxSwift
import RxCocoa

extension UIButton {
    
    /// Returns UIButton with custom parameters
    static func customButton(title: String? = nil,
                             image: UIImage? = nil,
                             tintColor: UIColor = .label,
                             backgroundColor: UIColor? = nil,
                             cornerRadius: CGFloat = 0.0,
                             textAlignment: NSTextAlignment = .natural,
                             font: UIFont = .systemFont(ofSize: 17, weight: .semibold),
                             action: Action<Void?>? = nil) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.setTitle(title, for: .normal)
        button.setTitleColor(tintColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius
        button.titleLabel?.font = font
        button.titleLabel?.textAlignment = textAlignment
        if let action = action {
            button.rx.tap.bind(to: action.binder).disposed(by: action.disposeBag)
        }
        
        return button
    }
    
    
    /// Returns UIButton with text only
    static func textOnly(title: String,
                         tintColor: UIColor = .label,
                         textAlignment: NSTextAlignment = .natural,
                         font: UIFont = .systemFont(ofSize: 17, weight: .semibold),
                         action: Action<Void?>? = nil) -> UIButton {
        return customButton(title: title,
                            tintColor: tintColor,
                            textAlignment: textAlignment,
                            font: font,
                            action: action)
    }
    
    
    /// Returns UIButton with text only
    static func imageOnly(image: UIImage?,
                          tintColor: UIColor = .label,
                          action: Action<Void?>? = nil) -> UIButton {
        return customButton(image: image,
                            tintColor: tintColor,
                            action: action)
    }
}

