//
//  BasketFooter.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 03.09.2022.
//

import Foundation
import UIKit

class BasketFooter: UICollectionReusableView {
    static let identifier = "BasketFooter"
    let breakLine1: UIView = {
       let breakLine = UIView()
        breakLine.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2).cgColor
        return breakLine
    }()
    
    let totalLabel: UILabel = {
       let totalLabel = UILabel()
        totalLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        totalLabel.font = UIFont(name: "MarkPro-Regular", size: 15)
        totalLabel.textAlignment = .center
        totalLabel.attributedText = NSMutableAttributedString(string: "Total", attributes: [NSAttributedString.Key.kern: -0.33])
        return totalLabel
    }()
    
    let deliveryLabel: UILabel = {
       let deliveryLabel = UILabel()
        deliveryLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        deliveryLabel.font = UIFont(name: "MarkPro-Regular", size: 15)
        deliveryLabel.textAlignment = .center
        deliveryLabel.attributedText = NSMutableAttributedString(string: "Delivery", attributes: [NSAttributedString.Key.kern: -0.33])
        return deliveryLabel
    }()
    
    let nameOfLabelsStackView: UIStackView = {
       let nameOfLabelsStackView = UIStackView()
        nameOfLabelsStackView.axis = .vertical
        nameOfLabelsStackView.alignment = .leading
        nameOfLabelsStackView.distribution = .equalSpacing
        return nameOfLabelsStackView
    }()
    
    let costLabel: UILabel = {
       let costLabel = UILabel()
        costLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)

        costLabel.font = UIFont(name: "MarkPro-Bold", size: 15)
        costLabel.textAlignment = .center
        costLabel.attributedText = NSMutableAttributedString(string: "$0 us", attributes: [NSAttributedString.Key.kern: -0.33])
        return costLabel
    }()
    
    let deliveryCostLabel: UILabel = {
    let deliveryLabel = UILabel()
        deliveryLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        deliveryLabel.font = UIFont(name: "MarkPro-Bold", size: 15)
        deliveryLabel.textAlignment = .center
        deliveryLabel.attributedText = NSMutableAttributedString(string: "Free", attributes: [NSAttributedString.Key.kern: -0.33])
        return deliveryLabel
    }()
    
    let valusesStackView: UIStackView = {
       let valusesStackView = UIStackView()
        valusesStackView.axis = .vertical
        valusesStackView.alignment = .leading
        valusesStackView.distribution = .equalSpacing
        return valusesStackView
    }()
    
    let breakLine2: UIView = {
       let breakLine = UIView()
        breakLine.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2).cgColor
        return breakLine
    }()
    
    let checkOutButton: UIButton = {
       let checkOutButton = UIButton()
        checkOutButton.layer.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1).cgColor
        checkOutButton.layer.cornerRadius = 10
        let attributedTitle = NSMutableAttributedString(string: "Checkout", attributes: [NSAttributedString.Key.kern: -0.33, NSAttributedString.Key.font: UIFont(name: "MarkPro-Bold", size: 20)!])
        checkOutButton.setAttributedTitle(attributedTitle, for: .normal)
        checkOutButton.setTitleColor(UIColor.white, for: .normal)
        return checkOutButton
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners([.bottomLeft, .bottomRight], radius: 30)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        
        addSubview(nameOfLabelsStackView)
        nameOfLabelsStackView.addArrangedSubview(totalLabel)
        nameOfLabelsStackView.addArrangedSubview(deliveryLabel)
        addSubview(valusesStackView)
        valusesStackView.addArrangedSubview(costLabel)
        valusesStackView.addArrangedSubview(deliveryCostLabel)
        addSubview(breakLine1)
        addSubview(breakLine2)
        addSubview(checkOutButton)
        setUpLayout()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(cost: Double) {
        let stringCost = String(cost)
        costLabel.attributedText = NSMutableAttributedString(string: ["$", stringCost, " us"].joined(), attributes: [NSAttributedString.Key.kern: -0.33])
    }
  
    func setUpLayout() {
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        deliveryLabel.translatesAutoresizingMaskIntoConstraints = false
        costLabel.translatesAutoresizingMaskIntoConstraints = false
        deliveryCostLabel.translatesAutoresizingMaskIntoConstraints = false
        breakLine1.translatesAutoresizingMaskIntoConstraints = false
        breakLine2.translatesAutoresizingMaskIntoConstraints = false
        checkOutButton.translatesAutoresizingMaskIntoConstraints = false
        nameOfLabelsStackView.translatesAutoresizingMaskIntoConstraints = false
        valusesStackView.translatesAutoresizingMaskIntoConstraints = false
   
        NSLayoutConstraint.activate([
            nameOfLabelsStackView.heightAnchor.constraint(equalToConstant: 50),
            nameOfLabelsStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            nameOfLabelsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 35),
            
            valusesStackView.heightAnchor.constraint(equalToConstant: 50),
            valusesStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            valusesStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35),
            
            breakLine1.heightAnchor.constraint(equalToConstant: 2),
            breakLine1.widthAnchor.constraint(equalToConstant: bounds.width),
            breakLine1.topAnchor.constraint(equalTo: self.topAnchor),
            
            breakLine2.topAnchor.constraint(equalTo: self.topAnchor, constant: 90),
            breakLine2.heightAnchor.constraint(equalToConstant: 1),
            breakLine2.widthAnchor.constraint(equalToConstant: bounds.width),
            
            checkOutButton.heightAnchor.constraint(equalToConstant: 54),
            checkOutButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            checkOutButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
            checkOutButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -42)
        ])
    }
}
