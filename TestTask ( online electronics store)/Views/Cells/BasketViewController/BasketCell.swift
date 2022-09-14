//
//  CartCell.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 03.09.2022.
//

import Foundation
import UIKit
import SDWebImage

class BasketCell: UICollectionViewCell {
    static let identifier = "CartCell"
    
    var productCount: Int = 0
    
    private var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        return containerView
    }()
    
    private let productImageView: UIImageView = {
        let productImageView = UIImageView()
        productImageView.backgroundColor = .white
        productImageView.contentMode = .scaleAspectFit
        productImageView.layer.masksToBounds = true
        productImageView.layer.cornerRadius = 10
        return productImageView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        titleLabel.font = UIFont(name: "MarkPro-Medium", size: 20)
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byCharWrapping
        titleLabel.attributedText = NSMutableAttributedString(string: "Title", attributes: [NSAttributedString.Key.kern: -0.33])
        return titleLabel
    }()
    
    let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.textColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        priceLabel.font = UIFont(name: "MarkPro-Medium", size: 20)
        priceLabel.attributedText = NSMutableAttributedString(string: "$0", attributes: [NSAttributedString.Key.kern: -0.33])
        return priceLabel
    }()
    
    let titleAndPriceStackView: UIStackView = {
        let titleAndPriceStackView = UIStackView()
        titleAndPriceStackView.axis = .vertical
        titleAndPriceStackView.distribution = .fill
        titleAndPriceStackView.alignment = .leading
        return titleAndPriceStackView
    }()
    
    let plusButton: UIButton = {
        let plusButton = UIButton(frame: CGRect(x: 0, y: 0, width: 9, height: 9))
        plusButton.setImage(UIImage(named: "PlusButton"), for: .normal)
        return plusButton
    }()
    
    let minusButton: UIButton = {
        let minusButton = UIButton(frame: CGRect(x: 0, y: 0, width: 9, height: 9))
        minusButton.setImage(UIImage(named: "MinusButton"), for: .normal)
        return minusButton
    }()
    
    let plusMinusStackView: UIStackView = {
        let plusMinusStackView = UIStackView()
        plusMinusStackView.axis = .vertical
        plusMinusStackView.distribution = .fillProportionally
        plusMinusStackView.alignment = .center
        plusMinusStackView.layer.backgroundColor = UIColor(red: 0.158, green: 0.156, blue: 0.262, alpha: 1).cgColor
        plusMinusStackView.layer.cornerRadius = 12
        plusMinusStackView.clipsToBounds = true
        
        return plusMinusStackView
    }()
    
    var countLabel: UILabel = {
        let countLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 12, height: 25))
        countLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        countLabel.font = UIFont(name: "MarkPro-Medium", size: 20)
        countLabel.attributedText = NSMutableAttributedString(string: "0", attributes: [NSAttributedString.Key.kern: -0.33])
        return countLabel
    }()
    
    let deleteButton: UIButton = {
        let deleteButton = UIButton()
        deleteButton.setImage(UIImage(named: "DeleteButton"), for: .normal)
        return deleteButton
    }()
    
    let cellStackView : UIStackView = {
        let cellStackView = UIStackView()
        cellStackView.axis = .horizontal
        cellStackView.distribution = .equalSpacing
        cellStackView.alignment = .center
        return cellStackView
    }()
    
    let emptyCartView: EmptyBasketView = {
        let emptyCartview = EmptyBasketView()
        return emptyCartview
        
    }()
    
    public func configure(title: String, price: Int,  picture: String, count: Int) {
        print("CELL IS CONFIGURING WITH \(count)")
        switchCellNotToEmpty(count: count)
        titleLabel.attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.kern: -0.33])
        priceLabel.attributedText = NSMutableAttributedString(string: ["$", String(price), ".00"].joined(), attributes: [NSAttributedString.Key.kern: -0.33])
        guard let url = URL(string: picture) else {return}
        productImageView.sd_setImage(with: url)
        countLabel.attributedText = NSMutableAttributedString(string: String(count), attributes: [NSAttributedString.Key.kern: -0.33])
        
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(containerView)
        containerView.addSubview(productImageView)
        containerView.addSubview(titleAndPriceStackView)
        containerView.addSubview(plusMinusStackView)
        containerView.addSubview(deleteButton)
        containerView.addSubview(cellStackView)
        
        titleAndPriceStackView.addArrangedSubview(titleLabel)
        titleAndPriceStackView.addArrangedSubview(priceLabel)
        
        plusMinusStackView.addArrangedSubview(minusButton)
        plusMinusStackView.addArrangedSubview(countLabel)
        plusMinusStackView.addArrangedSubview(plusButton)
        
        cellStackView.addArrangedSubview(productImageView)
        cellStackView.addArrangedSubview(titleAndPriceStackView)
        cellStackView.addArrangedSubview(plusMinusStackView)
        cellStackView.addArrangedSubview(deleteButton)
        
        containerView.addSubview(emptyCartView)
        
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    private func setUpLayout() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        titleAndPriceStackView.translatesAutoresizingMaskIntoConstraints  = false
        plusMinusStackView.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        emptyCartView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            cellStackView.heightAnchor.constraint(equalToConstant: 90),
            cellStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 22),
            cellStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25),
            cellStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -25),
            cellStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -22),
            
            productImageView.heightAnchor.constraint(equalToConstant: 88),
            productImageView.widthAnchor.constraint(equalToConstant: 88),
            //        productImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            //        productImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            
            
            titleAndPriceStackView.heightAnchor.constraint(equalToConstant: 80),
            titleAndPriceStackView.widthAnchor.constraint(equalToConstant: 153),
            //        titleAndPriceStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            
            plusMinusStackView.heightAnchor.constraint(equalToConstant: 73),
            plusMinusStackView.widthAnchor.constraint(equalToConstant: 26),
            
            deleteButton.heightAnchor.constraint(equalToConstant: 16),
            deleteButton.widthAnchor.constraint(equalToConstant: 15),
            
            emptyCartView.topAnchor.constraint(equalTo: containerView.topAnchor),
            emptyCartView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            emptyCartView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            emptyCartView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            
            
        ])
    }
    
    private func switchCellNotToEmpty(count: Int) {
        if count != 0 {
            emptyCartView.isHidden = true
        } else {
            emptyCartView.isHidden = false
        }
    }
}
