//
//  UIView + Extension.swift
//  MyGameApp
//
//  Created by Jennifer Chukwuemeka on 19/09/2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {return self.cornerRadius}
                set {
                    self.layer.cornerRadius = newValue
                }
    }
}
