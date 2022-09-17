//
//  UINavigationBar + Extension.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 29.08.2022.
//

import Foundation
import UIKit

extension UINavigationBar {
    func shouldRemoveShadow(_ value: Bool) -> Void {
        if value {
            self.setValue(true, forKey: "hidesShadow")
        } else {
            self.setValue(false, forKey: "hidesShadow")
        }
    }
}

