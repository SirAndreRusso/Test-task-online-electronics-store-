//
//  EmptyCartView.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 06.09.2022.
//

import Foundation
import UIKit

class EmptyCartView: UIView {
    let emptyCartView: UIView = {
        let emptyCartView = UIView()
        emptyCartView.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        emptyCartView.layer.cornerRadius = 30
        emptyCartView.layer.masksToBounds = true
        return emptyCartView
    }()
    
    let Label: UILabel = {
        let label = UILabel()
        label.text = "Корзина пока пуста"
        label.font = UIFont(name: "MarkPro-Bold", size: 25)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(emptyCartView)
        emptyCartView.addSubview(Label)
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLayout() {
        Label.translatesAutoresizingMaskIntoConstraints = false
        emptyCartView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emptyCartView.topAnchor.constraint(equalTo: self.topAnchor),
            emptyCartView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            emptyCartView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            emptyCartView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            Label.heightAnchor.constraint(equalToConstant: 50),
            Label.widthAnchor.constraint(equalToConstant: 300),
            Label.centerXAnchor.constraint(equalTo: emptyCartView.centerXAnchor),
            Label.centerYAnchor.constraint(equalTo: emptyCartView.centerYAnchor)
        ])
    }
}
