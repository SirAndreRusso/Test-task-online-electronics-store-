//
//  basketCollectionBackgroundView.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 15.09.2022.
//

import Foundation
import UIKit

class BasketCollectionBackgroundView: UIView {
    let basketCBGView: UIView = {
        let basketBGView = UIView()
        basketBGView.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        basketBGView.layer.cornerRadius = 30
        basketBGView.layer.masksToBounds = true
        return basketBGView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(basketCBGView)
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLayout() {
        basketCBGView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            basketCBGView.topAnchor.constraint(equalTo: self.topAnchor),
            basketCBGView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            basketCBGView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            basketCBGView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
