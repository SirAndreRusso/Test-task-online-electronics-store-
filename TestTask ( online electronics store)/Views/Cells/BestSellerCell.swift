//
//  BestSellerCell.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 24.08.2022.
//

import UIKit
class BestSellerCell: UICollectionViewCell {
    static let identifier = "BestSellerCell"
    
    private let parentView: UIView = {
       let parentView = UIView()
        parentView.layer.cornerRadius = 10
        parentView.backgroundColor = .white
        return parentView
    }()
    
    private let pictureImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let addToFavoriteButton: UIButton = {
        let addToFavoriteButton = UIButton()
        addToFavoriteButton.setImage(UIImage(named: "addToFavourite"), for: .normal)
        
        return addToFavoriteButton
    }()
    
    private let priceLabel: UILabel = {
       let priceLabel = UILabel()
        priceLabel.backgroundColor = .clear
        priceLabel.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        priceLabel.font = UIFont(name: "MarkPro-Bold", size: 16)
        priceLabel.textAlignment = .center
        priceLabel.attributedText = NSMutableAttributedString(string: "$1,047", attributes: [NSAttributedString.Key.kern: -0.33])
        return priceLabel
    }()
    
    private let discountPriceLabel: UILabel = {
        let discountPriceLabel = UILabel()
        discountPriceLabel.backgroundColor = .clear
        discountPriceLabel.textColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        discountPriceLabel.font = UIFont(name: "MarkPro-Medium", size: 10)
        discountPriceLabel.textAlignment = .center
        discountPriceLabel.attributedText = NSMutableAttributedString(string: "$1,500", attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.kern: -0.33])
        return discountPriceLabel
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.backgroundColor = .clear
        nameLabel.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        nameLabel.font = UIFont(name: "MarkPro-Regular", size: 10)
        nameLabel.attributedText = NSMutableAttributedString(string: "Samsung Galaxy s20 Ultra", attributes: [NSAttributedString.Key.kern: -0.33])
        return nameLabel
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(parentView)
        parentView.addSubview(pictureImageView)
        parentView.addSubview(addToFavoriteButton)
        parentView.addSubview(priceLabel)
        parentView.addSubview(discountPriceLabel)
        parentView.addSubview(nameLabel)
        
       
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        parentView.frame = contentView.bounds
        configureCellLayout()
       
    }
    private func configureCellLayout() {
        pictureImageView.translatesAutoresizingMaskIntoConstraints = false
        pictureImageView.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        pictureImageView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        pictureImageView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        pictureImageView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -55).isActive = true
        
        
        
        addToFavoriteButton.translatesAutoresizingMaskIntoConstraints = false
        addToFavoriteButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        addToFavoriteButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        addToFavoriteButton.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 6).isActive = true
//        addToFavoriteButton.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 147).isActive = true
        addToFavoriteButton.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -16).isActive = true
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        priceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 175).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 21).isActive = true
//        priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -110).isActive = true
        
        discountPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        discountPriceLabel.heightAnchor.constraint(equalToConstant: 13).isActive = true
        discountPriceLabel.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 180).isActive = true
        discountPriceLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 7).isActive = true
//        discountPriceLabel.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -70).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.widthAnchor.constraint(equalToConstant: 122).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 13).isActive = true
        nameLabel.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 199).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 20).isActive = true
//        nameLabel.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -94).isActive = true

    }
    public func configure(isFavourites: Bool, title: String, priceWithoutDiscount: Int, discountPrice: Int, picture: String) {
        nameLabel.text = title
        discountPriceLabel.text = ["$", String(discountPrice)].joined()
        priceLabel.text = ["$", String(priceWithoutDiscount)].joined()
        guard let url = URL(string: picture) else {return}
        pictureImageView.sd_setImage(with: url)
        

}
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        pictureImageView.image = nil
//        nameLabel.text = nil
//        priceLabel.text = nil
//        discountPriceLabel.text = nil
// 
//    }
   
}
