//
//  NavigationView.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 02.09.2022.
//

import Foundation
import UIKit

class NavigationView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .defaultBackgroundColor()
        return containerView
    }()
    
    let leftButton: UIButton = {
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "BackButton"), for: .normal)
        return backButton
    }()
    
    let rightButton: UIButton = {
        let cartButton = UIButton()
        cartButton.setImage(UIImage(named: "CartButton"), for: .normal)
        return cartButton
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.backgroundColor = .clear
        title.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        title.font = UIFont(name: "MarkPro-Medium", size: 18)
        title.textAlignment = .center
        title.attributedText = NSMutableAttributedString(string: "Product Details", attributes: [NSAttributedString.Key.kern: -0.33])
        return title
    }()
    
    convenience init(leftButtonImage: String, rightButtonImage: String = "", title: String) {
        self.init()
        self.leftButton.setImage(UIImage(named: leftButtonImage), for: .normal)
        self.rightButton.setImage(UIImage(named: rightButtonImage), for: .normal)
        let stringTitle = title
        let attributedTitle = NSMutableAttributedString(string: stringTitle, attributes: [NSAttributedString.Key.kern: -0.33])
        self.title.attributedText = attributedTitle
    }
    
    private func setUpLayout() {
        self.addSubview(containerView)
        containerView.addSubview(leftButton)
        containerView.addSubview(rightButton)
        containerView.addSubview(title)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            leftButton.heightAnchor.constraint(equalToConstant: 37),
            leftButton.widthAnchor.constraint(equalToConstant: 37),
            leftButton.topAnchor.constraint(equalTo: containerView.topAnchor),
            leftButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 35),
            
            rightButton.heightAnchor.constraint(equalToConstant: 37),
            rightButton.widthAnchor.constraint(equalToConstant: 37),
            rightButton.topAnchor.constraint(equalTo: containerView.topAnchor),
            rightButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -35),
            
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
