//
//  UIBarButtonItem + CustomInit.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/31/20.
//

import UIKit
import RxCocoa
import RxSwift

extension UIBarButtonItem {
    
    /// Returns UIButton with custom parameters
    static func customButton(title: String? = nil,
                             image: UIImage? = nil,
                             tintColor: UIColor = .tintColor,
                             style: Style = .plain,
                             action: UIControl.Action<Void?>? = nil) -> UIBarButtonItem {
        let button = UIBarButtonItem()
        button.style = style
        button.title = title
        button.image = image
        button.tintColor = tintColor
        if let action = action {
            button.rx.tap.bind(to: action.binder).disposed(by: action.disposeBag)
        }
        
        return button
    }
}
