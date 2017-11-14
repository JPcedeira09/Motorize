//
//  IBDesignableButton.swift
//  Motorize
//
//  Created by joao cedeira on 06/10/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class PrettyView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
    }
    
}
