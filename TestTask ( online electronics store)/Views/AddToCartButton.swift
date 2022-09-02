//
//  AddToCartButton.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 31.08.2022.
//

import Foundation
import UIKit

class AddToCartButton: UIButton {
    let  addToCartLabel: UILabel = {
        let addToCartLabel = UILabel()
        addToCartLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        addToCartLabel.font = UIFont(name: "MarkPro-Bold", size: 19)
        addToCartLabel.attributedText = NSMutableAttributedString(string: "Add to Cart", attributes: [NSAttributedString.Key.kern: -0.33])
        return addToCartLabel
    }()
    
    let  priceLabel: UILabel = {
        let priceLabel =  UILabel()
        priceLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        priceLabel.font = UIFont(name: "MarkPro-Bold", size: 19)
        priceLabel.attributedText = NSMutableAttributedString(string: "$0.00", attributes: [NSAttributedString.Key.kern: -0.33])
        return priceLabel
    }()
    convenience init (price: String){
        self.init()
        self.layer.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1).cgColor
        self.layer.cornerRadius = 10
        setUpLayout()
    }
    private func setUpLayout() {
        addSubview(addToCartLabel)
        addSubview(priceLabel)
        
        addToCartLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addToCartLabel.heightAnchor.constraint(equalToConstant: 25),

            addToCartLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            addToCartLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            
            priceLabel.heightAnchor.constraint(equalToConstant: 25),

            priceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
    func configure(price: Int) {
        let stringPrice = "$" + String(price) + ".00"
        let attributedPrice = NSMutableAttributedString(string: stringPrice, attributes: [NSAttributedString.Key.kern: -0.33])
        priceLabel.attributedText = attributedPrice
    }
}
