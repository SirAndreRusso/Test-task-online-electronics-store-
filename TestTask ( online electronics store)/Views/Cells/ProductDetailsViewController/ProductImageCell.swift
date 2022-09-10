//
//  ProductImageCell.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 30.08.2022.
//

import Foundation
import UIKit
import SDWebImage

class ProductImageCell: UICollectionViewCell {
    static let identifier = "ProductImageCell"
    
    private let productImageView: UIImageView = {
        let productImageView = UIImageView()
        productImageView.backgroundColor = .white
        productImageView.contentMode = .scaleAspectFit
        productImageView.layer.masksToBounds = true
        productImageView.layer.cornerRadius = 20
        return productImageView
    }()
    
    public func configure(picture: String) {
        guard let url = URL(string: picture) else {return}
        productImageView.sd_setImage(with: url)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(productImageView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        productImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
