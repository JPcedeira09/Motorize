//
//  IBDesignableGradient2.swift
//  Motorize
//
//  Created by joao cedeira on 06/10/17.
//  Copyright © 2017 JoaoPauloFerreira. All rights reserved.
//

import Foundation

import UIKit

@IBDesignable public class GradientView2: UIView {
    @IBInspectable public var topColor: UIColor? {
        didSet {
            configureView()
        }
    }
    @IBInspectable public var bottomColor: UIColor? {
        didSet {
            configureView()
        }
    }
    
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        configureView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    public override func tintColorDidChange() {
        super.tintColorDidChange()
        configureView()
    }
    
    func configureView() {
        let layer = self.layer as! CAGradientLayer
        let locations = [ 0.0, 1.0 ]
        layer.locations = locations as [NSNumber]
        var color1 = topColor ?? self.tintColor as! UIColor
        var color2 = bottomColor ?? UIColor.black as! UIColor
        let colors: Array <AnyObject> = [ color1.cgColor, color2.cgColor ]
        layer.colors = colors
    }
}
