//
//  WXXCellAnimation.swift
//  SwiftFileManager
//
//  Created by DevZHR on 2017/8/18.
//  Copyright © 2017 DevZHR. All rights reserved.
//

import UIKit

class WXXCellAnimation: NSObject {

    open class func shakeAnimation(view: UIView) {
        let shakeAnimation = CAKeyframeAnimation()
        shakeAnimation.keyPath = "transform.rotation"
        let angle = Double.pi/4/18;
        shakeAnimation.delegate = view as? CAAnimationDelegate
        shakeAnimation.values = [-angle, angle, -angle]
        shakeAnimation.repeatCount = MAXFLOAT
        view.layer.add(shakeAnimation, forKey: "shake")
    }
    
    open class func deleteAnimation(view: UIView) {
        view.layer.opacity = 0;
        let narrowAnimation = CABasicAnimation(keyPath: "transform.scale")
        narrowAnimation.fromValue = 1
        narrowAnimation.toValue = 0;
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity");
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0;
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [narrowAnimation, opacityAnimation]
        groupAnimation.duration = 0.2;
        groupAnimation.delegate = view as? CAAnimationDelegate
        view.layer.add(groupAnimation, forKey: "delete")
    }
    
}
