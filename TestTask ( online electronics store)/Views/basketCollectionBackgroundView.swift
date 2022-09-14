//
//  basketCollectionBackgroundView.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 15.09.2022.
//

import Foundation
import UIKit

class BasketCollectionBackgroundView: UIView {
    let basketBGView: UIView = {
        let basketBGView = UIView()
        basketBGView.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        basketBGView.layer.cornerRadius = 30
        basketBGView.layer.masksToBounds = true
        return basketBGView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(basketBGView)
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLayout() {
        basketBGView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            basketBGView.topAnchor.constraint(equalTo: self.topAnchor),
            basketBGView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            basketBGView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            basketBGView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
