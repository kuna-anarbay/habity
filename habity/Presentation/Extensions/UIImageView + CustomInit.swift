//
//  UIImageView + CustomInit.swift
//  habity
//
//  Created by Kuanysh Anarbay on 10/29/20.
//

import UIKit

extension UIImageView {
    
    ///Returns UIImageView with custom parameters
    static func customImageView(image: UIImage?,
                                contentMode: UIImageView.ContentMode = .scaleAspectFit) -> UIImageView {
        let imageView = UIImageView(image: image)
        imageView.contentMode = contentMode
        
        return imageView
    }
}
