//
//  DetailsCustomView.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 31.08.2022.
//

import Foundation
import UIKit

class DetailsCustomView: UIView {
    
    convenience init(title: String, picture: String) {
        self.init()
        addSubview(containerView)
        containerView.addSubview(pictureImageView)
        pictureImageView.image = UIImage(named: picture)
        containerView.addSubview(titleLabel)
        titleLabel.text = title
        pictureImageView.image = UIImage(named: picture)
        setUpLayout()
    }
    
    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.clipsToBounds = true
        
        return containerView
    }()
    
    let pictureImageView: UIImageView = {
        let pictureImageView = UIImageView()
        return pictureImageView
    }()
    
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        titleLabel.font = UIFont(name: "MarkPro-Regular", size: 11)
        titleLabel.text = "Title"
        return titleLabel
    }()
    
    func configure(title: String, picture: String) {
        titleLabel.text = title
        pictureImageView.image = UIImage(named: picture)
    }
    
    private func setUpLayout() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        pictureImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            pictureImageView.heightAnchor.constraint(equalToConstant: 28),
            pictureImageView.widthAnchor.constraint(equalToConstant: 28),
            pictureImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            pictureImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            titleLabel.heightAnchor.constraint(equalToConstant: 14),
            titleLabel.topAnchor.constraint(equalTo: pictureImageView.bottomAnchor, constant: 5),
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}
