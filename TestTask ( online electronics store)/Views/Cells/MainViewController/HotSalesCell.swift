//
//  HotSalesCell.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 25.08.2022.
//

import UIKit
class HotSalesCell: UICollectionViewCell {
    
    static let identifier = "HotSalesCell"
    
    private let pictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    private let newImageView: UIImageView = {
        let newImageView = UIImageView()
        newImageView.clipsToBounds = true
        newImageView.contentMode = .scaleToFill
        newImageView.layer.masksToBounds = true
        newImageView.layer.cornerRadius = newImageView.bounds.width/2.0
        newImageView.backgroundColor = nil
        return newImageView
    }()
    
    private let titleLabel: UILabel = {
        let brandLabel = UILabel()
        brandLabel.backgroundColor =  .clear
        brandLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        brandLabel.font = UIFont(name: "SFProDisplay-Bold", size: 25)
        brandLabel.textAlignment = .center
        brandLabel.numberOfLines = 0
        return brandLabel
    }()
    
    private let subtitleLabel: UILabel = {
        var subtitleLabel = UILabel()
        subtitleLabel.backgroundColor =  .clear
        subtitleLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        subtitleLabel.font = UIFont(name: "SFProDisplay-Regular", size: 11)
        subtitleLabel.numberOfLines = 0
        return subtitleLabel
    }()
    
    let buyNowButton: UIButton = {
        var buyNowButton = UIButton(type: .system)
        buyNowButton.backgroundColor = .white
        buyNowButton.setTitleColor(UIColor.black, for: .normal)
        buyNowButton.layer.cornerRadius = 5
        buyNowButton.setTitle("Buy now!", for: .normal)
        buyNowButton.titleLabel?.font = UIFont(name: "SFProDisplay-Bold", size: 11)
        buyNowButton.isEnabled = true
        return buyNowButton
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(pictureImageView)
        contentView.addSubview(newImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(buyNowButton)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        pictureImageView.frame = contentView.bounds
        configureCellLayout()
        
    }
    
    private func configureCellLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 68).isActive = true
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.heightAnchor.constraint(equalToConstant: 13).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 103).isActive = true
        
        buyNowButton.translatesAutoresizingMaskIntoConstraints = false
        buyNowButton.widthAnchor.constraint(equalToConstant: 98).isActive = true
        buyNowButton.heightAnchor.constraint(equalToConstant: 23).isActive = true
        buyNowButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32).isActive = true
        buyNowButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 142).isActive = true
        
        
        newImageView.translatesAutoresizingMaskIntoConstraints = false
        newImageView.widthAnchor.constraint(equalToConstant: 27).isActive = true
        newImageView.heightAnchor.constraint(equalToConstant: 27).isActive = true
        newImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32).isActive = true
        newImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 23).isActive = true
    }
    
    public func configure(isNew: Bool?, title: String, subtitle: String, picture: String,  isBuy: Bool?) {
        if  isNew == nil {
            newImageView.isHidden = true
        } else {
            newImageView.image = UIImage(named: "NewImage")
        }
        titleLabel.text = title
        subtitleLabel.text = subtitle
        if isBuy == nil {
            buyNowButton.isHidden = true
        }
        guard let url = URL(string: picture) else {return}
        pictureImageView.sd_setImage(with: url)
    }
    
}
