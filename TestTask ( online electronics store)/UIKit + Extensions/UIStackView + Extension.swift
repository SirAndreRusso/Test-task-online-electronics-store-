//
//  UIStackView + Extension.swift
//  TestTask (Samsung online shop)
//
//  Created by Андрей Русин on 22.08.2022.
//

import UIKit
import UIKit
extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis:NSLayoutConstraint.Axis) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        
    }
}
