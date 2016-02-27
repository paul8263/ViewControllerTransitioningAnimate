//
//  DimView.swift
//  ViewTransitioningAnimate
//
//  Created by Paul Zhang on 27/02/2016.
//  Copyright © 2016 Paul. All rights reserved.
//

import UIKit

class DimView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clearColor()
    }

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
//        Must use CGColor here!!
        let colors = [UIColor.clearColor().CGColor, UIColor(red: 0, green: 0, blue: 0, alpha: 0.7).CGColor]
        let locations = [CGFloat(0.0), CGFloat(1.0)]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradientCreateWithColors(colorSpace, colors, locations)
        let x = CGRectGetMidX(bounds)
        let y = CGRectGetMidY(bounds)
        let startPoint = CGPoint(x: x, y: y)
        let radius = max(x, y)
        CGContextDrawRadialGradient(context, gradient, startPoint, 0, startPoint, radius, CGGradientDrawingOptions.DrawsAfterEndLocation)

    }
    

}
