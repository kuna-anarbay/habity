//
//  UIStackView+CustomInit.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/29/20.
//

import UIKit

extension UIStackView {
    
    /// Returns UIStackView with custom parameters
    static func customStackView(axis: NSLayoutConstraint.Axis,
                                arrangedSubviews: [UIView] = [],
                                spacing: CGFloat = 0.0,
                                distribution: Distribution = .fill) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = axis
        stackView.distribution = distribution
        stackView.spacing = spacing
        
        return stackView
    }
    
    /// Returns Vertical UIStackView with custom parameters
    static func verticalStackView(arrangedSubviews: [UIView] = [],
                                  spacing: CGFloat = 0.0,
                                  distribution: Distribution = .fill) -> UIStackView {
        return customStackView(axis: .vertical,
                               arrangedSubviews: arrangedSubviews,
                               spacing: spacing,
                               distribution: distribution)
    }
    
    /// Returns Horizontal UIStackView with custom parameters
    static func horizontalStackView(arrangedSubviews: [UIView] = [],
                                    spacing: CGFloat = 0.0,
                                    distribution: Distribution = .fill) -> UIStackView {
        return customStackView(axis: .horizontal,
                               arrangedSubviews: arrangedSubviews,
                               spacing: spacing,
                               distribution: distribution)
    }
    
    
}
