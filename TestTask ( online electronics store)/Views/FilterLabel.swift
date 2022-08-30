//
//  FilterLabel.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 30.08.2022.
//

import UIKit

class FilterLabel: UILabel {
   
    convenience init(title: String) {
        self.init(title: title)
        LabelSetUp()
    }
    private func LabelSetUp() {
    textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
    font = UIFont(name: "MarkPro-Medium", size: 18)
    numberOfLines = 0
    
    
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
