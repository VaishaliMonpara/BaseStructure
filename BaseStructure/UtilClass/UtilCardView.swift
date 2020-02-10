//
//  UtilCardView.swift
//  TapARideApp
//
//  Created by MAC0008 on 26/09/18.
//  Copyright © 2018 MAC0008. All rights reserved.
//

import UIKit

class UtilCardView : UIView
{
    @IBInspectable var cornerRadius: CGFloat = 5
    @IBInspectable var BorderWidth: CGFloat = 2
    @IBInspectable var BorderColor: UIColor? = UtilColor().getBoarderGrayColor()
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 2
    @IBInspectable var shadowColor: UIColor? = UtilColor().getBoarderGrayColor()
    @IBInspectable var shadowOpacity: Float = 0.3
    @IBInspectable var shadowRadius: CGFloat = 4
    @IBInspectable var GradientFirstColor: UIColor? = UIColor.clear
    @IBInspectable var GradientTowColor: UIColor? = UIColor.clear
    
    let gredientLayer = CAGradientLayer()
    
    override func layoutSubviews()
    {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = BorderWidth
        layer.borderColor = BorderColor?.cgColor
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
        layer.shadowRadius = shadowRadius
        
        
        gredientLayer.frame = bounds
        gredientLayer.colors = [GradientFirstColor?.cgColor, GradientTowColor?.cgColor]
        gredientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gredientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gredientLayer.cornerRadius = cornerRadius
        
        layer.insertSublayer(gredientLayer, at: 0)
    }
    
    override func layoutIfNeeded()
    {
        gredientLayer.removeFromSuperlayer()
        layer.insertSublayer(gredientLayer, at: 0)
    }
}
