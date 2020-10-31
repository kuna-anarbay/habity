//
//  UILabel + Font.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/29/20.
//

import UIKit

extension UILabel {
    
    ///Returns UILabel with custom parameters
    private static func customLabel(text: String? = nil,
                                    font: UIFont = .systemFont(ofSize: 17),
                                    textColor: UIColor = .label,
                                    numberOfLines: Int = 0,
                                    textAlignment: NSTextAlignment = .natural) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        label.numberOfLines = numberOfLines
        label.textAlignment = textAlignment
        
        return label
    }
    
    
    ///Return large title label
    static func largeTitle(text: String? = nil,
                           weight: UIFont.Weight = .regular,
                           textColor: UIColor = .label,
                           numberOfLines: Int = 0,
                           textAlignment: NSTextAlignment = .natural) -> UILabel {
        return customLabel(text: text,
                           font: .systemFont(ofSize: 34, weight: weight),
                           textColor: textColor,
                           numberOfLines: numberOfLines,
                           textAlignment: textAlignment)
    }
    
    
    ///Return body label
    static func body(text: String? = nil,
                     weight: UIFont.Weight = .regular,
                     textColor: UIColor = .label,
                     numberOfLines: Int = 0,
                     textAlignment: NSTextAlignment = .natural) -> UILabel {
        return customLabel(text: text,
                           font: .systemFont(ofSize: 17, weight: weight),
                           textColor: textColor,
                           numberOfLines: numberOfLines,
                           textAlignment: textAlignment)
    }
    
    
    ///Return subheadline label
    static func subheadline(text: String? = nil,
                            weight: UIFont.Weight = .regular,
                            textColor: UIColor = .label,
                            numberOfLines: Int = 0,
                            textAlignment: NSTextAlignment = .natural) -> UILabel {
        return customLabel(text: text,
                           font: .systemFont(ofSize: 15, weight: weight),
                           textColor: textColor,
                           numberOfLines: numberOfLines,
                           textAlignment: textAlignment)
    }
    
    
    ///Return foornote label
    static func footnote(text: String? = nil,
                         weight: UIFont.Weight = .regular,
                         textColor: UIColor = .label,
                         numberOfLines: Int = 0,
                         textAlignment: NSTextAlignment = .natural) -> UILabel {
        return customLabel(text: text,
                           font: .systemFont(ofSize: 13, weight: weight),
                           textColor: textColor,
                           numberOfLines: numberOfLines,
                           textAlignment: textAlignment)
    }
}
