//
//  CategoryCell.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 23.08.2022.
//

import UIKit
class CategoryCell: UICollectionViewCell {
    
    static let identifier = "CategoryCell"
    
    let parentView: UIView = {
        let parentView = UIView(frame: CGRect(x: 0, y: 0, width: 71, height: 93))
        parentView.layer.backgroundColor = nil
        return parentView
    }()
    
    var categoryLabel: UILabel = {
       let categoryLabel = UILabel()
        categoryLabel.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        categoryLabel.font = UIFont(name: "MarkPro-Medium", size: 12)
        categoryLabel.textAlignment = .center
        categoryLabel.attributedText = NSMutableAttributedString(string: "Phones", attributes: [NSAttributedString.Key.kern: -0.33])
        return categoryLabel
    }()
    
    private let orangeImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 71.0/2.0
        imageView.backgroundColor = .specialOrange()
        return imageView
    }()
    
    private let whiteImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 71.0/2.0
        imageView.backgroundColor = .white
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(parentView)
        parentView.addSubview(orangeImageView)
        parentView.addSubview(whiteImageView)
        parentView.addSubview(categoryLabel)
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        parentView.frame = contentView.bounds
        configureCellLayout()
        
    }
    
    public func configure(category: String, imageForNormal: String, imageForPressed: String ) {
        categoryLabel.text = category
        orangeImageView.image = UIImage(named: imageForPressed)
        whiteImageView.image = UIImage(named: imageForNormal)
}
    
    
    func showImageView() {
        whiteImageView.alpha = 1.0
        categoryLabel.textColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
    }
    
    func hideImageView() {
        whiteImageView.alpha = 0.0
        categoryLabel.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
    }
    private func configureCellLayout() {
        orangeImageView.translatesAutoresizingMaskIntoConstraints = false
        orangeImageView.widthAnchor.constraint(equalToConstant: 71).isActive = true
        orangeImageView.heightAnchor.constraint(equalToConstant: 71).isActive = true
        orangeImageView.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        orangeImageView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        orangeImageView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        orangeImageView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -22).isActive = true
        
        whiteImageView.translatesAutoresizingMaskIntoConstraints = false
        whiteImageView.widthAnchor.constraint(equalToConstant: 71).isActive = true
        whiteImageView.heightAnchor.constraint(equalToConstant: 71).isActive = true
        whiteImageView.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        whiteImageView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        whiteImageView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        whiteImageView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -22).isActive = true
        
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.widthAnchor.constraint(equalToConstant: 71).isActive = true
        categoryLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        categoryLabel.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 78).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        categoryLabel.bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
    }
}
