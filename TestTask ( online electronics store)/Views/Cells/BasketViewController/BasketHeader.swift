//
//  BasketHeader.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 10.09.2022.
//

import Foundation
import UIKit

class BasketHeader: UICollectionReusableView {
    static let identifier = "BasketHeader"
    
    let containerView: UIView = {
        let containerView = UIView()
        return containerView
    }()
    
    let myCartLabel: UILabel = {
        let myCartLabel = UILabel()
        
        myCartLabel.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        myCartLabel.font = UIFont(name: "MarkPro-Bold", size: 35)
        myCartLabel.textAlignment = .left
        myCartLabel.attributedText = NSMutableAttributedString(string: "My Cart", attributes: [NSAttributedString.Key.kern: -0.33])
        return myCartLabel
    }()
    
    let roundCornerView: UIView = {
       let roundCornerView = UIView()
        roundCornerView.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        roundCornerView.roundCorners([.topLeft, .topRight], radius: 30)
//        roundCornerView.layer.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1).cgColor
        
        
        return roundCornerView
    }()
    override func layoutSubviews() {
        roundCornerView.roundCorners([.topLeft, .topRight], radius: 30)
    }
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.addSubview(containerView)
        containerView.addSubview(myCartLabel)
        containerView.addSubview(roundCornerView)
        setUpLayout()
    }
    public func configure(text: String) {
        let attributedText = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.kern: -0.33])
        myCartLabel.attributedText = attributedText
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUpLayout(){
        containerView.translatesAutoresizingMaskIntoConstraints = false
        myCartLabel.translatesAutoresizingMaskIntoConstraints = false
        roundCornerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 198),
            
            myCartLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 50),
            myCartLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 42),
            myCartLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -42),
            
            roundCornerView.heightAnchor.constraint(equalToConstant: 58),
            roundCornerView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 140),
            roundCornerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            roundCornerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            roundCornerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}
