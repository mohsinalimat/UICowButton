//
//  UICowButton.swift
//  很牛叉的一个Button控件
//
//  Created by 骆扬 on 2017/12/20.
//  Copyright © 2017年 LY. All rights reserved.
//

import UIKit

@IBDesignable
class UICowButton: UIButton {
    
    // MARK: - round
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            gradientLayer?.cornerRadius = cornerRadius
        }
    }
    
    // MARK: - gradient
    private var gradientLayer: CAGradientLayer?
    @IBInspectable var from: UIColor = .white {
        didSet {
            setGradient()
        }
    }
    @IBInspectable var to: UIColor = .white {
        didSet {
            setGradient()
        }
    }
    @IBInspectable var isGradientX: Bool = true {
        didSet {
            setGradient()
        }
    }
    func setGradient() {
        if let gLayer = gradientLayer  {
            gLayer.removeFromSuperlayer()
        }
        gradientLayer = CAGradientLayer()
        gradientLayer?.colors = [from.cgColor, to.cgColor]
        // gradientLayer.locations = [0, 1] // 默认就是均匀分布
        if isGradientX {
            gradientLayer?.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer?.endPoint = CGPoint(x: 1, y: 0)
        } else {
            gradientLayer?.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer?.endPoint = CGPoint(x: 0, y: 1)
        }
        gradientLayer?.frame = self.bounds
        gradientLayer?.cornerRadius = cornerRadius
        
        self.layer.insertSublayer(gradientLayer!, at: 0)
    }
    
    // MARK: shadow
    @IBInspectable var shadow: UIColor = .white {
        didSet {
            setShadow()
        }
    }
    func setShadow() {
        layer.shadowColor = shadow.cgColor
        layer.shadowOffset = CGSize.init(width: 0, height: 4)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 10
    }
    

}
