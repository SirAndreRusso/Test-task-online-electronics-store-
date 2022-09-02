//
//  ProductDetailsView.swift
//  TestTask ( online electronics store)
//
//  Created by Андрей Русин on 30.08.2022.
//

import Foundation
import UIKit

class ProductDetailsCell: UICollectionViewCell {
    
    static let identifier = "ProductDetailsCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 30
        self.clipsToBounds = true
        
        contentView.addSubview(containerView)
        containerView.addSubview(titleStackView)
        containerView.addSubview(ratingStackView)
        containerView.addSubview(lineView)
        containerView.addSubview(labelsStackView)
        containerView.addSubview(selectColorAndCapacitylabel)
        containerView.addSubview(detailsStackView)
        containerView.addSubview(colorsStackView)
        containerView.addSubview(capacityStackView)
        containerView.addSubview(colorAndCapacityStackView)
        containerView.addSubview(addToCartButton)
        
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(favoriteImageView)
        
        ratingStackView.addArrangedSubview(starImageView1)
        ratingStackView.addArrangedSubview(starImageView2)
        ratingStackView.addArrangedSubview(starImageView3)
        ratingStackView.addArrangedSubview(starImageView4)
        ratingStackView.addArrangedSubview(starImageView5)
        
        labelsStackView.addArrangedSubview(shopLabel)
        labelsStackView.addArrangedSubview(detailsLabel)
        labelsStackView.addArrangedSubview(featuresLabel)
        
        detailsStackView.addArrangedSubview(cpuView)
        detailsStackView.addArrangedSubview(cameraView)
        detailsStackView.addArrangedSubview(ssdView)
        detailsStackView.addArrangedSubview(sdView)
        
        colorsStackView.addArrangedSubview(firstColorButton)
        colorsStackView.addArrangedSubview(secondColorButton)
        
        capacityStackView.addArrangedSubview(firstCapacityButton)
        capacityStackView.addArrangedSubview(secondCapacityButton)
        
        colorAndCapacityStackView.addArrangedSubview(colorsStackView)
        colorAndCapacityStackView.addArrangedSubview(capacityStackView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - layoutSubviews()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureCellLayout()
    }
    
//MARK: - configure()
    
    public func configure(title: String, isFavourites: Bool, rating: Double, cpu: String, camera: String, ssd: String, sd: String, price: Int) {
        titleLabel.attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.kern: -0.33])
        if !isFavourites {favoriteImageView.isOpaque = true}
        let roundedRating = round(rating)
        if  roundedRating == 4 {
            ratingStackView.removeArrangedSubview(starImageView5)
        } else if roundedRating == 3 {
            ratingStackView.removeArrangedSubview(starImageView5)
            ratingStackView.removeArrangedSubview(starImageView4)
        } else if roundedRating == 2 {
            ratingStackView.removeArrangedSubview(starImageView5)
            ratingStackView.removeArrangedSubview(starImageView4)
            ratingStackView.removeArrangedSubview(starImageView3)
        } else if roundedRating == 1 {
            ratingStackView.removeArrangedSubview(starImageView5)
            ratingStackView.removeArrangedSubview(starImageView4)
            ratingStackView.removeArrangedSubview(starImageView3)
            ratingStackView.removeArrangedSubview(starImageView2)
        }
        cpuView.configure(title: cpu, picture: "CPU")
        cameraView.configure(title: camera, picture: "Camera")
        ssdView.configure(title: ssd, picture: "SSD")
        sdView.configure(title: sd, picture: "SD")
        addToCartButton.configure(price: price)
    }
    
// MARK: - Container view
    
    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 30
        containerView.clipsToBounds = true
        return containerView
    }()
    
    // MARK: - Title stackView
    
    var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        titleLabel.attributedText = NSMutableAttributedString(string: "Title", attributes: [NSAttributedString.Key.kern: -0.33])
        titleLabel.font = UIFont(name: "MarkPro-Medium", size: 23)
        return titleLabel
    }()
    
    let favoriteImageView: UIImageView = {
        let favoriteImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 37, height: 33))
        favoriteImageView.layer.cornerRadius = 10
        favoriteImageView.clipsToBounds = true
        favoriteImageView.image = UIImage(named: "FavouriteImage")
        return favoriteImageView
    }()
    
// MARK: - Rating stackView
    
    let titleStackView: UIStackView = {
        let titleStackView = UIStackView()
        titleStackView.axis = .horizontal
        titleStackView.distribution = .fillProportionally
        titleStackView.alignment = .top
        return titleStackView
    }()
    
    let starImageView1: UIImageView = {
        let starImageView = UIImageView()
        starImageView.backgroundColor = .clear
        starImageView.image = UIImage(named: "Star")
        return starImageView
    }()
    
    let starImageView2: UIImageView = {
        let starImageView = UIImageView()
        starImageView.backgroundColor = .clear
        starImageView.image = UIImage(named: "Star")
        return starImageView
    }()
    
    let starImageView3: UIImageView = {
        let starImageView = UIImageView()
        starImageView.backgroundColor = .clear
        starImageView.image = UIImage(named: "Star")
        return starImageView
    }()
    
    let starImageView4: UIImageView = {
        let starImageView = UIImageView()
        starImageView.backgroundColor = .clear
        starImageView.image = UIImage(named: "Star")
        return starImageView
    }()
    
    let starImageView5: UIImageView = {
        let starImageView = UIImageView()
        starImageView.backgroundColor = .clear
        starImageView.image = UIImage(named: "Star")
        return starImageView
    }()
    
    let ratingStackView: UIStackView = {
        let ratingStackView = UIStackView()
        ratingStackView.axis = .horizontal
        ratingStackView.distribution = .fill
        ratingStackView.spacing = 9
        
        return ratingStackView
    }()
    
// MARK: - Labels stackView
    
    let shopLabel: UILabel = {
        let shopLabel = UILabel()
        shopLabel.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        shopLabel.font = UIFont(name: "MarkPro-Bold", size: 20)
        shopLabel.attributedText = NSMutableAttributedString(string: "Shop", attributes: [NSAttributedString.Key.kern: -0.33])
        shopLabel.backgroundColor = .clear
        return shopLabel
    }()
    
    let detailsLabel: UILabel = {
        let detailsLabel = UILabel()
        detailsLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        detailsLabel.font = UIFont(name: "MarkPro-Regular", size: 20)
        detailsLabel.attributedText = NSMutableAttributedString(string: "Details", attributes: [NSAttributedString.Key.kern: -0.33])
        detailsLabel.backgroundColor = .clear
        return detailsLabel
    }()
    
    let featuresLabel: UILabel = {
        let featuresLabel = UILabel()
        featuresLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        featuresLabel.font = UIFont(name: "MarkPro-Regular", size: 20)
        featuresLabel.attributedText = NSMutableAttributedString(string: "Features", attributes: [NSAttributedString.Key.kern: -0.33])
        featuresLabel.backgroundColor = .clear
        return featuresLabel
    }()
    
    let labelsStackView: UIStackView = {
        let labelsStackView = UIStackView()
        labelsStackView.distribution = .equalSpacing
        labelsStackView.axis = .horizontal
        labelsStackView.alignment = .center
        return labelsStackView
    }()
    
    // MARK: - orange line
    
    let lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        lineView.layer.cornerRadius = 1.5
        lineView.clipsToBounds = true
        return lineView
    }()
    
// MARK: - Details stackView
    
    var cpuView: DetailsCustomView = {
        let cpuView = DetailsCustomView(title: "CPU", picture: "CPU")
        return cpuView
    }()
    var cameraView: DetailsCustomView = {
        let cameraView = DetailsCustomView(title: "Camera", picture: "Camera")
        return cameraView
    }()
    var ssdView: DetailsCustomView = {
        let ssdView = DetailsCustomView(title: "SSD", picture: "SSD")
        return ssdView
    }()
    var sdView: DetailsCustomView = {
        let sdView = DetailsCustomView(title: "SD", picture: "SD")
        return sdView
    }()
    
    let detailsStackView: UIStackView = {
        let detailsStackView = UIStackView()
        detailsStackView.axis = .horizontal
        detailsStackView.alignment = .top
        detailsStackView.distribution = .equalSpacing
        return detailsStackView
    }()
    
// MARK: - Select color and capacity label
    
    let selectColorAndCapacitylabel: UILabel = {
        let selectColorAndCapacitylabel = UILabel()
        selectColorAndCapacitylabel.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        selectColorAndCapacitylabel.font = UIFont(name: "MarkPro-Medium", size: 16)
        selectColorAndCapacitylabel.attributedText = NSMutableAttributedString(string: "Select color and capacity", attributes: [NSAttributedString.Key.kern: -0.33])
        return selectColorAndCapacitylabel
    }()
    
// MARK: - Colors stackView

    let firstColorButton: UIButton = {
        let firstColorButton = UIButton()
        firstColorButton.backgroundColor = UIColor(red: 0.467, green: 0.175, blue: 0.012, alpha: 1)
        firstColorButton.clipsToBounds = true
        firstColorButton.layer.cornerRadius = 20
        let checkMarkImageView = UIImageView(frame: CGRect(x: 11.5, y: 13.25, width: 17, height: 12.5))
        checkMarkImageView.image = UIImage(named: "CheckMark")
        firstColorButton.addSubview(checkMarkImageView)
        return firstColorButton
    }()
    
    let secondColorButton: UIButton = {
        let secondColorButton = UIButton()
        secondColorButton.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        secondColorButton.clipsToBounds = true
        secondColorButton.layer.cornerRadius = 20
        return secondColorButton
    }()
    
    let colorsStackView: UIStackView = {
        let colorsStackView = UIStackView()
        colorsStackView.axis = .horizontal
        colorsStackView.alignment = .top
        colorsStackView.spacing = 18
        colorsStackView.distribution = .fill
        return colorsStackView
    }()
    
//  MARK: - Capacity stackView
    
    let firstCapacityButton: UIButton = {
        let firstCapacityButton = UIButton()
        firstCapacityButton.layer.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1).cgColor
        firstCapacityButton.clipsToBounds = true
        firstCapacityButton.layer.cornerRadius = 10
        firstCapacityButton.layer.masksToBounds = true
        let atributedTitle1 = NSMutableAttributedString(string: "128 GB", attributes: [NSAttributedString.Key.kern: -0.33])
        firstCapacityButton.setAttributedTitle(atributedTitle1, for: .normal)
        firstCapacityButton.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 13)
        firstCapacityButton.titleLabel?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return firstCapacityButton
    }()
    
    let secondCapacityButton: UIButton = {
        let secondCapacityButton = UIButton()
        secondCapacityButton.backgroundColor = .white
        secondCapacityButton.clipsToBounds = true
        secondCapacityButton.layer.cornerRadius = 10
        let atributedTitle2 = NSMutableAttributedString(string: "256 gb", attributes: [NSAttributedString.Key.kern: -0.33])
        secondCapacityButton.setAttributedTitle(atributedTitle2, for: .normal)
        secondCapacityButton.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 13)
        secondCapacityButton.titleLabel?.textColor = UIColor(red: 0.554, green: 0.554, blue: 0.554, alpha: 1)
        return secondCapacityButton
    }()
    
    let capacityStackView: UIStackView = {
        let capacityStackView = UIStackView()
        capacityStackView.axis = .horizontal
        capacityStackView.alignment = .top
        capacityStackView.distribution = .fill
        return capacityStackView
    }()
    
// MARK: - Colors and capacity stackview
    
    let colorAndCapacityStackView: UIStackView = {
        let colorAndCapacityStackView = UIStackView()
        colorAndCapacityStackView.axis = .horizontal
        colorAndCapacityStackView.alignment = .center
        colorAndCapacityStackView.distribution = .equalSpacing
        
        return colorAndCapacityStackView
    }()
    
    let addToCartButton: AddToCartButton = {
        let addToCartButton = AddToCartButton(price: "$0")
        return addToCartButton
    }()
    
// MARK: - Configure layout
    
    private func configureCellLayout() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteImageView.translatesAutoresizingMaskIntoConstraints = false
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        starImageView1.translatesAutoresizingMaskIntoConstraints = false
        starImageView2.translatesAutoresizingMaskIntoConstraints = false
        starImageView3.translatesAutoresizingMaskIntoConstraints = false
        starImageView4.translatesAutoresizingMaskIntoConstraints = false
        starImageView5.translatesAutoresizingMaskIntoConstraints = false
        ratingStackView.translatesAutoresizingMaskIntoConstraints = false
        shopLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsLabel.translatesAutoresizingMaskIntoConstraints = false
        featuresLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsStackView.translatesAutoresizingMaskIntoConstraints = false
        cpuView.translatesAutoresizingMaskIntoConstraints = false
        cameraView.translatesAutoresizingMaskIntoConstraints = false
        ssdView.translatesAutoresizingMaskIntoConstraints = false
        sdView.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        selectColorAndCapacitylabel.translatesAutoresizingMaskIntoConstraints = false
        firstColorButton.translatesAutoresizingMaskIntoConstraints = false
        secondColorButton.translatesAutoresizingMaskIntoConstraints = false
        colorsStackView.translatesAutoresizingMaskIntoConstraints = false
        firstCapacityButton.translatesAutoresizingMaskIntoConstraints = false
        secondCapacityButton.translatesAutoresizingMaskIntoConstraints = false
        capacityStackView.translatesAutoresizingMaskIntoConstraints = false
        addToCartButton.translatesAutoresizingMaskIntoConstraints = false
        colorAndCapacityStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            titleStackView.heightAnchor.constraint(equalToConstant: 33),
            titleStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 28),
            titleStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 38),
            titleStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -38),
            
            starImageView1.heightAnchor.constraint(equalToConstant: 18),
            starImageView1.widthAnchor.constraint(equalToConstant: 18),
            starImageView2.heightAnchor.constraint(equalToConstant: 18),
            starImageView2.widthAnchor.constraint(equalToConstant: 18),
            starImageView3.heightAnchor.constraint(equalToConstant: 18),
            starImageView3.widthAnchor.constraint(equalToConstant: 18),
            starImageView4.heightAnchor.constraint(equalToConstant: 18),
            starImageView4.widthAnchor.constraint(equalToConstant: 18),
            starImageView5.heightAnchor.constraint(equalToConstant: 18),
            starImageView5.widthAnchor.constraint(equalToConstant: 18),
            
            favoriteImageView.heightAnchor.constraint(equalToConstant: 33),
            favoriteImageView.widthAnchor.constraint(equalToConstant: 37),
            
            ratingStackView.heightAnchor.constraint(equalToConstant: 18),
            ratingStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 65),
            ratingStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 38),
            
            shopLabel.heightAnchor.constraint(equalToConstant: 25),
            shopLabel.widthAnchor.constraint(equalToConstant: 49),
            
            detailsLabel.heightAnchor.constraint(equalToConstant: 25),
            detailsLabel.widthAnchor.constraint(equalToConstant: 67),
            
            featuresLabel.heightAnchor.constraint(equalToConstant: 25),
            featuresLabel.widthAnchor.constraint(equalToConstant: 84),
            
            labelsStackView.heightAnchor.constraint(equalToConstant: 25),
            labelsStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 115),
            labelsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 45),
            labelsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -45),
            
            lineView.heightAnchor.constraint(equalToConstant: 3),
            lineView.widthAnchor.constraint(equalToConstant: 86),
            lineView.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: 8),
            lineView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 27),
            
            detailsStackView.heightAnchor.constraint(equalToConstant: 47),
            detailsStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 181),
            detailsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            detailsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            
            cpuView.heightAnchor.constraint(equalToConstant:  47),
            cpuView.widthAnchor.constraint(equalToConstant: 64),
            
            cameraView.heightAnchor.constraint(equalToConstant:  47),
            cameraView.widthAnchor.constraint(equalToConstant: 64),
            
            ssdView.heightAnchor.constraint(equalToConstant:  47),
            ssdView.widthAnchor.constraint(equalToConstant: 64),
            
            sdView.heightAnchor.constraint(equalToConstant:  47),
            sdView.widthAnchor.constraint(equalToConstant: 64),
            
            selectColorAndCapacitylabel.heightAnchor.constraint(equalToConstant: 21),
            selectColorAndCapacitylabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 257),
            selectColorAndCapacitylabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            
            firstColorButton.heightAnchor.constraint(equalToConstant: 40),
            firstColorButton.widthAnchor.constraint(equalToConstant: 40),
            firstColorButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 293),
            firstColorButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 35),
            
            secondColorButton.heightAnchor.constraint(equalToConstant: 40),
            secondColorButton.widthAnchor.constraint(equalToConstant: 40),
            
            firstCapacityButton.heightAnchor.constraint(equalToConstant: 30),
            firstCapacityButton.widthAnchor.constraint(equalToConstant: 71),
            
            secondCapacityButton.heightAnchor.constraint(equalToConstant: 30),
            secondCapacityButton.widthAnchor.constraint(equalToConstant: 71),
            
            colorsStackView.heightAnchor.constraint(equalToConstant: 40),
            capacityStackView.heightAnchor.constraint(equalToConstant: 30),
            
            colorAndCapacityStackView.heightAnchor.constraint(equalToConstant: 40),
            colorAndCapacityStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 293),
            colorAndCapacityStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 35),
            colorAndCapacityStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -35),
            
            addToCartButton.heightAnchor.constraint(equalToConstant: 54),
            addToCartButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 359),
            addToCartButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            addToCartButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            addToCartButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -33)
        ])
    }
}


