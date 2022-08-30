//
//  UIBarButtonItem + Extension.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 29.08.2022.
//

import Foundation
import UIKit

class filterBarButtonItem: UIBarButtonItem {
    override init() {
        super.init()
        self.image = UIImage(named: "FilterImage")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
