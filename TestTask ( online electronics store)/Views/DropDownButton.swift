//
//  DropDownButton.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 30.08.2022.
//

import Foundation
import UIKit

class DropDownButton: UIButton {
    convenience init(stringTitle: String ) {
        self.init()
        let atributedTitle = NSMutableAttributedString(string: stringTitle, attributes: [NSAttributedString.Key.kern: -0.33])
        self.setAttributedTitle(atributedTitle, for: .normal)
        self.clipsToBounds = true
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor(red: 0.863, green: 0.863, blue: 0.863, alpha: 1).cgColor
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DropDownMark")
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView.heightAnchor.constraint(equalToConstant: 8).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
       
        
        self.setAttributedTitle(atributedTitle, for: .normal)
        self.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 18)
        self.titleLabel?.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.heightAnchor.constraint(equalToConstant: 23).isActive = true
        self.titleLabel?.topAnchor.constraint(equalTo: self.topAnchor, constant: 7).isActive = true
        self.titleLabel?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -7).isActive = true
        self.titleLabel?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14).isActive = true
        
        self.backgroundColor = .white
    }
}
