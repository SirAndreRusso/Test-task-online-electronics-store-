//
//  SectionHeader.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 25.08.2022.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    static let identifier = "SectionHeader"
    
    var titleLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        view.font = UIFont(name: "MarkPro-Bold", size: 25)
        view.textAlignment = .center
        view.attributedText = NSMutableAttributedString(string: "view all", attributes: [NSAttributedString.Key.kern: -0.33])
        return view
    }()
    var openButton: UIButton = {
        let openButton = UIButton(type: .system)
        openButton.backgroundColor = .clear
        openButton.setTitleColor(UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1), for: .normal)
        openButton.titleLabel?.font = UIFont(name: "MarkPro-Regular", size: 15)
        return openButton
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        backgroundColor = .defaultBackgroundColor()
        
    }
    override func layoutSubviews() {
        //        configureLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    func configure(titleLabel: String, buttonTitle: String) {
        self.titleLabel.text = titleLabel
        self.openButton.setTitle(titleLabel, for: .normal)
        
    }
}

extension SectionHeader {
    
    private func configureLayout() {
        addSubview(titleLabel)
        addSubview(openButton)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        openButton.translatesAutoresizingMaskIntoConstraints = false
        openButton.heightAnchor.constraint(equalToConstant: 19).isActive = true
        openButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        openButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}
